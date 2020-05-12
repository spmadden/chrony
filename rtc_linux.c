/*
  $Header: /cvs/src/chrony/rtc_linux.c,v 1.32 2003/09/22 21:22:30 richard Exp $

  =======================================================================

  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2003
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 * 
 **********************************************************************

  =======================================================================

  Real-time clock driver for linux.  This interfaces the program with
  the clock that keeps time when the machine is turned off.

  */

#if defined LINUX

#ifdef sparc
#define __KERNEL__
#endif

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <sys/types.h>

#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <assert.h>
#include <string.h>

#include "logging.h"
#include "sched.h"
#include "local.h"
#include "util.h"
#include "sys_linux.h"
#include "regress.h"
#include "rtc.h"
#include "rtc_linux.h"
#include "io_linux.h"
#include "conf.h"
#include "memory.h"
#include "mkdirpp.h"

struct rtc_time {
	int tm_sec;
	int tm_min;
	int tm_hour;
	int tm_mday;
	int tm_mon;
	int tm_year;
	int tm_wday;
	int tm_yday;
	int tm_isdst;
};

/* ================================================== */
/* Forward prototypes */

static void measurement_timeout(void *any);

static void read_from_device(void *any);

/* ================================================== */

typedef enum {
  OM_NORMAL,
  OM_INITIAL,
  OM_AFTERTRIM
} OperatingMode;

static OperatingMode operating_mode = OM_NORMAL;

/* ================================================== */

static int fd = -1;

#define LOWEST_MEASUREMENT_PERIOD 15
#define HIGHEST_MEASUREMENT_PERIOD 480

/* Try to avoid doing regression after _every_ sample we accumulate */
#define N_SAMPLES_PER_REGRESSION 4

static int measurement_period = LOWEST_MEASUREMENT_PERIOD;

static int timeout_running = 0;
static SCH_TimeoutID timeout_id;

/* ================================================== */

/* Maximum number of samples held */
#define MAX_SAMPLES 64

/* Real time clock samples.  We store the seconds count as originally
   measured, together with a 'trim' that compensates these values for
   any steps made to the RTC to bring it back into line
   occasionally.  The trim is in seconds. */
static time_t rtc_sec[MAX_SAMPLES];
static double rtc_trim[MAX_SAMPLES];

/* Reference time, against which delta times on the RTC scale are measured */
static time_t rtc_ref;


/* System clock (gettimeofday) samples associated with the above
   samples. */
static struct timeval system_times[MAX_SAMPLES];

/* Number of samples currently stored. */
static int n_samples;   

/* Number of new samples since last regression */
static int n_samples_since_regression;

/* Number of runs of residuals in last regression (for logging) */
static int n_runs;

/* Coefficients */
/* Whether they are valid */
static int coefs_valid;

/* Reference time */
static time_t coef_ref_time;
/* Number of seconds by which RTC was fast of the system time at coef_ref_time */
static double coef_seconds_fast;

/* Estimated number of seconds that RTC gains relative to system time
   for each second of ITS OWN time */
static double coef_gain_rate;

/* Gain rate saved just before we step the RTC to correct it to the
   nearest second, so that we can write a useful set of coefs to the
   RTC data file once we have reacquired its offset after the step */
static double saved_coef_gain_rate;

/* Filename supplied by config file where RTC coefficients are
   stored. */
static char *coefs_file_name;

/* ================================================== */
/* Coefficients read from file at start of run. */

/* Whether we have tried to load the coefficients */
static int tried_to_load_coefs = 0;

/* Whether valid coefficients were read */
static int valid_coefs_from_file = 0;

/* Coefs read in */
static time_t file_ref_time;
static double file_ref_offset, file_rate_ppm;

/* ================================================== */

/* Flag to remember whether to assume the RTC is running on UTC */
static int rtc_on_utc = 0;

/* ================================================== */

static FILE *logfile=NULL;
static char *logfilename = NULL;
static unsigned long logwrites=0;

#define RTC_LOG "rtc.log"

/* ================================================== */

static void (*after_init_hook)(void *) = NULL;
static void *after_init_hook_arg = NULL;

/* ================================================== */

static void
discard_samples(int new_first)
{
  int n_to_save;

  if (!(new_first < n_samples)) {
    CROAK("new_first should be < n_samples");
  }
  if (!(new_first >= 0)) {
    CROAK("new_first should be non-negative");
  }

  n_to_save = n_samples - new_first;

  memmove(rtc_sec, rtc_sec + new_first, n_to_save * sizeof(time_t));
  memmove(rtc_trim, rtc_trim + new_first, n_to_save * sizeof(double));
  memmove(system_times, system_times + new_first, n_to_save * sizeof(struct timeval));

  n_samples = n_to_save;
  return;
}

/* ================================================== */

#define NEW_FIRST_WHEN_FULL 4

static void
accumulate_sample(time_t rtc, struct timeval *sys)
{

  if (n_samples == MAX_SAMPLES) {
    /* Discard oldest samples */
    discard_samples(NEW_FIRST_WHEN_FULL);
  }

  rtc_sec[n_samples] = rtc;

  /* Always use most recent sample as reference */
  rtc_ref = rtc;

  rtc_trim[n_samples] = 0.0;
  system_times[n_samples] = *sys;
  ++n_samples;
  ++n_samples_since_regression;
  return;
  
}

/* ================================================== */
/* The new_sample flag is to indicate whether to adjust the
   measurement period depending on the behaviour of the standard
   deviation. */

static void
run_regression(int new_sample,
               int *valid,
               time_t *ref,
               double *fast,
               double *slope)
{
  double rtc_rel[MAX_SAMPLES]; /* Relative times on RTC axis */
  double offsets[MAX_SAMPLES]; /* How much the RTC is fast of the system clock */
  int i, n;
  double est_intercept, est_slope;
  int best_new_start;

  if (n_samples > 0) {

    n = n_samples - 1;

    for (i=0; i<n_samples; i++) {
      rtc_rel[i] = rtc_trim[i] + (double)(rtc_sec[i] - rtc_ref);
      offsets[i] = ((double) (rtc_ref - system_times[i].tv_sec) -
                    (1.0e-6 * (double) system_times[i].tv_usec) +
                    rtc_rel[i]);

    }

    if (RGR_FindBestRobustRegression
        (rtc_rel, offsets,
         n_samples, 1.0e-9,
         &est_intercept, &est_slope,
         &n_runs,
         &best_new_start)) {

      /* Calculate and store coefficients.  We don't do any error
         bounds processing on any of these. */
      *valid = 1;
      *ref = rtc_ref;
      *fast = est_intercept;
      *slope = est_slope;

      if (best_new_start > 0) {
        discard_samples(best_new_start);
      }


    } else {
      /* Keep existing coefficients. */
    }
  } else {
    /* Keep existing coefficients. */
  }

}

/* ================================================== */

static void
slew_samples
(struct timeval *raw, struct timeval *cooked,
 double dfreq, double afreq_ppm,
 double doffset, int is_step_change,
 void *anything)
{
  int i;
  double elapsed;
  double new_freq;
  double old_freq;
  double delta_time;
  double old_seconds_fast, old_gain_rate;

  new_freq = 1.0e-6 * afreq_ppm;
  old_freq = (new_freq - dfreq) / (1.0 - dfreq);

  for (i=0; i<n_samples; i++) {
    UTI_DiffTimevalsToDouble(&elapsed, cooked, system_times + i);

    delta_time = -(elapsed * dfreq) - doffset;

    UTI_AddDoubleToTimeval(system_times + i, delta_time, system_times + i);

  }

  old_seconds_fast = coef_seconds_fast;
  old_gain_rate = coef_gain_rate;

  if (coefs_valid) {
    coef_seconds_fast += doffset;
    coef_gain_rate = 1.0 - ((1.0 + new_freq) / (1.0 + old_freq)) * (1.0 - coef_gain_rate);
  }

#if 0
  LOG(LOGS_INFO, LOGF_RtcLinux, "dfreq=%.8f doffset=%.6f new_freq=%.3f old_freq=%.3f old_fast=%.6f old_rate=%.3f new_fast=%.6f new_rate=%.3f",
      dfreq, doffset, 1.0e6*new_freq, 1.0e6*old_freq,
      old_seconds_fast, 1.0e6 * old_gain_rate,
      coef_seconds_fast, 1.0e6 * coef_gain_rate);
#endif

}

/* ================================================== */

/* Function to convert from a time_t value represenging UTC to the
   corresponding real time clock 'DMY HMS' form, taking account of
   whether the user runs his RTC on the local time zone or UTC */

static struct tm *
rtc_from_t(const time_t *t)
{
  if (rtc_on_utc) {
    return gmtime(t);
  } else {
    return localtime(t);
  }
}

/* ================================================== */

/* Inverse function to get back from RTC 'DMY HMS' form to time_t UTC
   form.  This essentially uses mktime(), but involves some awful
   complexity to cope with timezones.  The problem is that mktime's
   behaviour with regard to the daylight saving flag in the 'struct
   tm' does not seem to be reliable across all systems, unless that
   flag is set to zero. 

   tm_isdst = -1 does not seem to work with all libc's - it is treated
   as meaning there is DST, or fails completely.  (It is supposed to
   use the timezone info to work out whether summer time is active at
   the specified epoch).

   tm_isdst = 1 fails if the local timezone has no summer time defined.

   The approach taken is as follows.  Suppose the RTC is on localtime.
   We perform all mktime calls with the tm_isdst field set to zero.

   Let y be the RTC reading in 'DMY HMS' form.  Let M be the mktime
   function with tm_isdst=0 and L be the localtime function.

   We seek x such that y = L(x).  Now there will exist a value Z(t)
   such that M(L(t)) = t + Z(t) for all t, where Z(t) depends on
   whether daylight saving is active at time t.

   We want L(x) = y.  Therefore M(L(x)) = x + Z = M(y).  But
   M(L(M(y))) = M(y) + Z.  Therefore x = M(y) - Z = M(y) - (M(L(M(y)))
   - M(y)).

   The case for the RTC running on UTC is identical but without the
   potential complication that Z depends on t.
*/

static time_t
t_from_rtc(struct tm *stm) {
  struct tm temp1, temp2;
  long diff;
  time_t t1, t2;

  temp1 = *stm;
  temp1.tm_isdst = 0;
  
  t1 = mktime(&temp1);
  if (rtc_on_utc) {
    temp2 = *gmtime(&t1);
  } else {
    temp2 = *localtime(&t1);
  }
  
  temp2.tm_isdst = 0;
  t2 = mktime(&temp2);
  diff = t2 - t1;

  return t1 - diff;
}

/* ================================================== */

static void
setup_config(void)
{
  if (CNF_GetRTCOnUTC()) {
    rtc_on_utc = 1;
  } else {
    rtc_on_utc = 0;
  }
}

/* ================================================== */
/* Read the coefficients from the file where they were saved
   the last time the program was run. */

static void
read_coefs_from_file(void)
{
  FILE *in;
  char line[256];

  if (!tried_to_load_coefs) {

    valid_coefs_from_file = 0; /* only gets set true if we succeed */

    tried_to_load_coefs = 1;

    in = fopen(coefs_file_name, "r");
    if (in) {
      if (fgets(line, sizeof(line), in)) {
        if (sscanf(line, "%d%ld%lf%lf",
                   &valid_coefs_from_file,
                   &file_ref_time,
                   &file_ref_offset,
                   &file_rate_ppm) == 4) {
        } else {
          LOG(LOGS_WARN, LOGF_RtcLinux, "Could not parse coefficients line from RTC file %s",
              coefs_file_name);
        }
      } else {
        LOG(LOGS_WARN, LOGF_RtcLinux, "Could not read first line from RTC file %s",
            coefs_file_name);
      }
      fclose(in);
    } else {
      LOG(LOGS_WARN, LOGF_RtcLinux, "Could not open RTC file %s for reading",
          coefs_file_name);
    }
  }
}

/* ================================================== */
/* Write the coefficients to the file where they will be read
   the next time the program is run. */

static int
write_coefs_to_file(int valid,time_t ref_time,double offset,double rate)
{
  struct stat buf;
  char *temp_coefs_file_name;
  FILE *out;

  /* Create a temporary file with a '.tmp' extension. */

  temp_coefs_file_name = (char*) Malloc(strlen(coefs_file_name)+8);

  if(!temp_coefs_file_name) {
    return RTC_ST_BADFILE;
  }

  strcpy(temp_coefs_file_name,coefs_file_name);
  strcat(temp_coefs_file_name,".tmp");

  out = fopen(temp_coefs_file_name, "w");
  if (!out) {
    Free(temp_coefs_file_name);
    LOG(LOGS_WARN, LOGF_RtcLinux, "Could not open temporary RTC file %s.tmp for writing",
        coefs_file_name);
    return RTC_ST_BADFILE;
  }

  /* Gain rate is written out in ppm */
  fprintf(out, "%1d %ld %.6f %.3f\n",
          valid,ref_time, offset, 1.0e6 * rate);

  fclose(out);

  /* Clone the file attributes from the existing file if there is one. */

  if (!stat(coefs_file_name,&buf)) {
    chown(temp_coefs_file_name,buf.st_uid,buf.st_gid);
    chmod(temp_coefs_file_name,buf.st_mode&0777);
  }

  /* Rename the temporary file to the correct location (see rename(2) for details). */

  if (rename(temp_coefs_file_name,coefs_file_name)) {
    unlink(temp_coefs_file_name);
    Free(temp_coefs_file_name);
    LOG(LOGS_WARN, LOGF_RtcLinux, "Could not replace old RTC file %s.tmp with new one %s",
        coefs_file_name, coefs_file_name);
    return RTC_ST_BADFILE;
  }

  Free(temp_coefs_file_name);

  return RTC_ST_OK;
}


/* ================================================== */
/* file_name is the name of the file where we save the RTC params
   between executions.  Return status is whether we could initialise
   on this version of the system. */

int
RTC_Linux_Initialise(void)
{
  int major, minor, patch;
  char *direc;

  /* Check whether we can support the real time clock.

     Linux 1.2.x - haven't checked yet

     Linux 1.3.x - don't know, haven't got a system to look at

     Linux 2.0.x - For x<=31, using any variant of the adjtimex() call
     sets the kernel into a mode where the RTC was updated every 11
     minutes.  The only way to escape this is to use settimeofday().
     Since we need to have sole control over the RTC to be able to
     measure its drift rate, and there is no 'notify' callback to warn
     you that the kernel is going to do this, I can't see a way to
     support this.

     Linux 2.0.x - For x>=32 the adjtimex()/RTC behaviour was
     modified, so that as long as the STA_UNSYNC flag is set the RTC
     is left alone.  This is the mode we exploit here, so that the RTC
     continues to go its own sweet way, unless we make updates to it
     from this module.

     Linux 2.1.x - don't know, haven't got a system to look at.

     Linux 2.2.x, 2.3.x and 2.4.x are believed to be OK for all
     patch levels

     */

  SYS_Linux_GetKernelVersion(&major, &minor, &patch);

  /* Obviously this test can get more elaborate when we know about
     more system types. */
  if (major != 2) {
    return 0;
  } else {
    switch (minor) {
      case 0:
        if (patch <= 31) {
          return 0;
        }
        break;
      case 1:
        return 0;
        break;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        break; /* OK for all patch levels */
    } 
  }

  /* Setup details depending on configuration options */
  setup_config();

  /* In case it didn't get done by pre-init */
  coefs_file_name = CNF_GetRtcFile();

  /* Try to open device */

  fd = open (CNF_GetRtcDevice(), O_RDWR);
  if (fd < 0) {
    LOG(LOGS_ERR, LOGF_RtcLinux, "Could not open %s, %s", CNF_GetRtcDevice(), strerror(errno));
    return 0;
  }

  n_samples = 0;
  n_samples_since_regression = 0;
  n_runs = 0;
  coefs_valid = 0;

  measurement_period = LOWEST_MEASUREMENT_PERIOD;

  operating_mode = OM_NORMAL;

  /* Register file handler */
  SCH_AddInputFileHandler(fd, read_from_device, NULL);

  /* Register slew handler */
  LCL_AddParameterChangeHandler(slew_samples, NULL);

  if (CNF_GetLogRtc()) {
    direc = CNF_GetLogDir();
    if (!mkdir_and_parents(direc)) {
      LOG(LOGS_ERR, LOGF_RtcLinux, "Could not create directory %s", direc);
      logfile = NULL;
    } else {
      logfilename = MallocArray(char, 2 + strlen(direc) + strlen(RTC_LOG));
      strcpy(logfilename, direc);
      strcat(logfilename, "/");
      strcat(logfilename, RTC_LOG);
      logfile = fopen(logfilename, "a");
      if (!logfile) {
        LOG(LOGS_WARN, LOGF_RtcLinux, "Couldn't open logfile %s for update", logfilename);
      }
    }
  }

  return 1;
}

/* ================================================== */

void
RTC_Linux_Finalise(void)
{
  if (timeout_running) {
    SCH_RemoveTimeout(timeout_id);
    timeout_running = 0;
  }

  /* Remove input file handler */
  if (fd >= 0) {
    SCH_RemoveInputFileHandler(fd);
    close(fd);

    /* Save the RTC data */
    (void) RTC_Linux_WriteParameters();

  }

  if (logfile) {
    fclose(logfile);
  }

}

/* ================================================== */

static void
switch_interrupts(int onoff)
{
  int status;

  if (onoff) {
    status = ioctl(fd, RTC_UIE_ON, 0);
    if (status < 0) {
      LOG(LOGS_ERR, LOGF_RtcLinux, "Could not start measurement : %s", strerror(errno));
      return;
    }
  } else {
    status = ioctl(fd, RTC_UIE_OFF, 0);
    if (status < 0) {
      LOG(LOGS_ERR, LOGF_RtcLinux, "Could not stop measurement : %s", strerror(errno));
      return;
    }
  }
}    

/* ================================================== */

static void
measurement_timeout(void *any)
{
  timeout_running = 0;
  switch_interrupts(1);
}

/* ================================================== */

static void
set_rtc(time_t new_rtc_time)
{
  struct tm rtc_tm;
  struct rtc_time rtc_raw;
  int status;

  rtc_tm = *rtc_from_t(&new_rtc_time);

  rtc_raw.tm_sec = rtc_tm.tm_sec;
  rtc_raw.tm_min = rtc_tm.tm_min;
  rtc_raw.tm_hour = rtc_tm.tm_hour;
  rtc_raw.tm_mday = rtc_tm.tm_mday;
  rtc_raw.tm_mon = rtc_tm.tm_mon;
  rtc_raw.tm_year = rtc_tm.tm_year;

  status = ioctl(fd, RTC_SET_TIME, &rtc_raw);
  if (status < 0) {
    LOG(LOGS_ERR, LOGF_RtcLinux, "Could not set RTC time");
  }

}

/* ================================================== */

static void
handle_initial_trim(void)
{
  double rate;
  long delta_time;
  double rtc_error_now, sys_error_now;

    /* The idea is to accumulate some number of samples at 1 second
       intervals, then do a robust regression fit to this.  This
       should give a good fix on the intercept (=system clock error
       rel to RTC) at a particular time, removing risk of any
       particular sample being an outlier.  We can then look at the
       elapsed interval since the epoch recorded in the RTC file,
       and correct the system time accordingly. */
    
  run_regression(1, &coefs_valid, &coef_ref_time, &coef_seconds_fast, &coef_gain_rate);

  n_samples_since_regression = 0;
  n_samples = 0;

  read_coefs_from_file();

  if (valid_coefs_from_file) {
    /* Can process data */
    delta_time = coef_ref_time - file_ref_time;
    rate = 1.0e-6 * file_rate_ppm;
    rtc_error_now = file_ref_offset + rate * (double) delta_time;
          
    /* sys_error_now is positive if the system clock is fast */
    sys_error_now = rtc_error_now - coef_seconds_fast;
          
    LOG(LOGS_INFO, LOGF_RtcLinux, "System trim from RTC = %f", sys_error_now);
    LCL_AccumulateOffset(sys_error_now);
  } else {
    LOG(LOGS_WARN, LOGF_RtcLinux, "No valid file coefficients, cannot trim system time");
  }
  
  coefs_valid = 0;
  
  (after_init_hook)(after_init_hook_arg);
  
  operating_mode = OM_NORMAL;

  return;
}

/* ================================================== */

static void
handle_relock_after_trim(void)
{
  int valid;
  time_t ref;
  double fast, slope;

  run_regression(1, &valid, &ref, &fast, &slope);

  if (valid) {
    write_coefs_to_file(1,ref,fast,saved_coef_gain_rate);
  } else {
    LOG(LOGS_WARN, LOGF_RtcLinux, "Could not do regression after trim");
  }

  n_samples = 0;
  n_samples_since_regression = 0;
  operating_mode = OM_NORMAL;
  measurement_period = LOWEST_MEASUREMENT_PERIOD;
}

/* ================================================== */

/* Day number of 1 Jan 1970 */
#define MJD_1970 40587

static void
process_reading(time_t rtc_time, struct timeval *system_time)
{
  double rtc_fast;

  accumulate_sample(rtc_time, system_time);

  switch (operating_mode) {
    case OM_NORMAL:

      if (n_samples_since_regression >= /* 4 */ 1 ) {
        run_regression(1, &coefs_valid, &coef_ref_time, &coef_seconds_fast, &coef_gain_rate);
        n_samples_since_regression = 0;
      }
      
      break;
    case OM_INITIAL:
      if (n_samples_since_regression >= 8) {
        handle_initial_trim();
      }
      break;
    case OM_AFTERTRIM:
      if (n_samples_since_regression >= 8) {
        handle_relock_after_trim();
      }
      break;
    default:
      CROAK("Impossible");
      break;
  }  


  if (logfile) {
    rtc_fast = (double)(rtc_time - system_time->tv_sec) - 1.0e-6 * (double) system_time->tv_usec;

    if (((logwrites++) % 32) == 0) {
      fprintf(logfile,
              "===============================================================================\n"
              "   Date (UTC) Time   RTC fast (s) Val   Est fast (s)   Slope (ppm)  Ns  Nr Meas\n"
              "===============================================================================\n");
    }
    
    fprintf(logfile, "%s %14.6f %1d  %14.6f  %12.3f  %2d  %2d %4d\n",
            UTI_TimeToLogForm(system_time->tv_sec),
            rtc_fast,
            coefs_valid,
            coef_seconds_fast, coef_gain_rate * 1.0e6, n_samples, n_runs, measurement_period);

    fflush(logfile);
  }    

}

/* ================================================== */

static void
read_from_device(void *any)
{
  int status;
  unsigned long data;
  struct timeval sys_time;
  struct rtc_time rtc_raw;
  struct tm rtc_tm;
  time_t rtc_t;
  double read_err;
  int error = 0;

  status = read(fd, &data, sizeof(data));
  if (status < 0) {
    /* This looks like a bad error : the file descriptor was indicating it was
     * ready to read but we couldn't read anything.  Give up. */
    LOG(LOGS_ERR, LOGF_RtcLinux, "Could not read flags %s : %s", CNF_GetRtcDevice(), strerror(errno));
    error = 1;
    SCH_RemoveInputFileHandler(fd);
    switch_interrupts(0); /* Likely to raise error too, but just to be sure... */
    close(fd);
    fd = -1;
    if (logfile) {
      fclose(logfile);
      logfile = NULL;
    }
    return;
  }    

  if ((data & RTC_UIE) == RTC_UIE) {
    /* Update interrupt detected */
    
    /* Read RTC time, sandwiched between two polls of the system clock
       so we can bound any error. */

    LCL_ReadCookedTime(&sys_time, &read_err);

    status = ioctl(fd, RTC_RD_TIME, &rtc_raw);
    if (status < 0) {
      LOG(LOGS_ERR, LOGF_RtcLinux, "Could not read time from %s : %s", CNF_GetRtcDevice(), strerror(errno));
      error = 1;
      goto turn_off_interrupt;
    }

    /* Convert RTC time into a struct timeval */
    rtc_tm.tm_sec = rtc_raw.tm_sec;
    rtc_tm.tm_min = rtc_raw.tm_min;
    rtc_tm.tm_hour = rtc_raw.tm_hour;
    rtc_tm.tm_mday = rtc_raw.tm_mday;
    rtc_tm.tm_mon = rtc_raw.tm_mon;
    rtc_tm.tm_year = rtc_raw.tm_year;

    rtc_t = t_from_rtc(&rtc_tm);

    if (rtc_t == (time_t)(-1)) {
      LOG(LOGS_ERR, LOGF_RtcLinux, "Could not convert RTC time to timeval");
      error = 1;
      goto turn_off_interrupt;
    }      

    process_reading(rtc_t, &sys_time);

    if (n_samples < 4) {
      measurement_period = LOWEST_MEASUREMENT_PERIOD;
    } else if (n_samples < 6) {
      measurement_period = LOWEST_MEASUREMENT_PERIOD << 1;
    } else if (n_samples < 10) {
      measurement_period = LOWEST_MEASUREMENT_PERIOD << 2;
    } else if (n_samples < 14) {
      measurement_period = LOWEST_MEASUREMENT_PERIOD << 3;
    } else {
      measurement_period = LOWEST_MEASUREMENT_PERIOD << 4;
    }

  }

turn_off_interrupt:

  switch (operating_mode) {
    case OM_INITIAL:
      if (error) {
        LOG(LOGS_WARN, LOGF_RtcLinux, "Could not complete initial step due to errors");
        operating_mode = OM_NORMAL;
        (after_init_hook)(after_init_hook_arg);

        switch_interrupts(0);
    
        timeout_running = 1;
        timeout_id = SCH_AddTimeoutByDelay((double) measurement_period, measurement_timeout, NULL);
      }

      break;

    case OM_AFTERTRIM:
      if (error) {
        LOG(LOGS_WARN, LOGF_RtcLinux, "Could not complete after trim relock due to errors");
        operating_mode = OM_NORMAL;

        switch_interrupts(0);
    
        timeout_running = 1;
        timeout_id = SCH_AddTimeoutByDelay((double) measurement_period, measurement_timeout, NULL);
      }
      
      break;

    case OM_NORMAL:
      switch_interrupts(0);
    
      timeout_running = 1;
      timeout_id = SCH_AddTimeoutByDelay((double) measurement_period, measurement_timeout, NULL);

      break;
    default:
      CROAK("Impossible");
      break;
  }

}

/* ================================================== */

void
RTC_Linux_TimeInit(void (*after_hook)(void *), void *anything)
{
  after_init_hook = after_hook;
  after_init_hook_arg = anything;

  operating_mode = OM_INITIAL;
  timeout_running = 0;
  switch_interrupts(1);

}

/* ================================================== */

void
RTC_Linux_StartMeasurements(void)
{
  timeout_running = 0;
  measurement_timeout(NULL);
}

/* ================================================== */

int
RTC_Linux_WriteParameters(void)
{
  int retval;

  if (fd < 0) {
    return RTC_ST_NODRV;
  }
  
  if (coefs_valid) {
    retval = write_coefs_to_file(1,coef_ref_time, coef_seconds_fast, coef_gain_rate);
  } else {
   /* Don't change the existing file, it may not be 100% valid but is our
      current best guess. */
    retval = RTC_ST_OK; /*write_coefs_to_file(0,0,0.0,0.0); */
  }

  return(retval);
}

/* ================================================== */
/* Try to set the system clock from the RTC, in the same manner as
   /sbin/clock -s -u would do.  We're not as picky about OS version
   etc in this case, since we have fewer requirements regarding the
   RTC behaviour than we do for the rest of the module. */

void
RTC_Linux_TimePreInit(void)
{
  int fd, status;
  struct rtc_time rtc_raw;
  struct tm rtc_tm;
  time_t rtc_t, estimated_correct_rtc_t;
  long interval;
  double accumulated_error = 0.0;
  struct timeval new_sys_time;

  coefs_file_name = CNF_GetRtcFile();

  setup_config();
  read_coefs_from_file();

  fd = open(CNF_GetRtcDevice(), O_RDONLY);

  if (fd < 0) {
    return; /* Can't open it, and won't be able to later */
  }

  status = ioctl(fd, RTC_RD_TIME, &rtc_raw);

  if (status >= 0) {
    /* Convert to seconds since 1970 */
    rtc_tm.tm_sec = rtc_raw.tm_sec;
    rtc_tm.tm_min = rtc_raw.tm_min;
    rtc_tm.tm_hour = rtc_raw.tm_hour;
    rtc_tm.tm_mday = rtc_raw.tm_mday;
    rtc_tm.tm_mon = rtc_raw.tm_mon;
    rtc_tm.tm_year = rtc_raw.tm_year;
    
    rtc_t = t_from_rtc(&rtc_tm);

    if (rtc_t != (time_t)(-1)) {

      /* Work out approximatation to correct time (to about the
         nearest second) */
      if (valid_coefs_from_file) {
        interval = rtc_t - file_ref_time;
        accumulated_error = file_ref_offset + (double)(interval) * 1.0e-6 * file_rate_ppm;

        /* Correct time */
        LOG(LOGS_INFO, LOGF_RtcLinux, "Set system time, error in RTC = %f",
            accumulated_error);
        estimated_correct_rtc_t = rtc_t - (long)(0.5 + accumulated_error);
      } else {
        estimated_correct_rtc_t = rtc_t - (long)(0.5 + accumulated_error);
      }

      new_sys_time.tv_sec = estimated_correct_rtc_t;
      new_sys_time.tv_usec = 0;

      /* Tough luck if this fails */
      if (settimeofday(&new_sys_time, NULL) < 0) {
        LOG(LOGS_WARN, LOGF_RtcLinux, "Could not settimeofday");
      }
    } else {
      LOG(LOGS_WARN, LOGF_RtcLinux, "Could not convert RTC reading to seconds since 1/1/1970");
    }
  }

  close(fd);
}

/* ================================================== */

int
RTC_Linux_GetReport(RPT_RTC_Report *report)
{
  report->ref_time = (unsigned long) coef_ref_time;
  report->n_samples = n_samples;
  report->n_runs = n_runs;
  if (n_samples > 1) {
    report->span_seconds = ((rtc_sec[n_samples-1] - rtc_sec[0]) +
                            (long)(rtc_trim[n_samples-1] - rtc_trim[0]));
  } else {
    report->span_seconds = 0;
  }
  report->rtc_seconds_fast = coef_seconds_fast;
  report->rtc_gain_rate_ppm = 1.0e6 * coef_gain_rate;
  return 1;
}

/* ================================================== */

int
RTC_Linux_Trim(void)
{
  struct timeval now;
  double local_clock_err;


  /* Remember the slope coefficient - we won't be able to determine a
     good one in a few seconds when we determine the new offset! */
  saved_coef_gain_rate = coef_gain_rate;

  if (fabs(coef_seconds_fast) > 1.0) {

    LOG(LOGS_INFO, LOGF_RtcLinux, "Trimming RTC, error = %.3f seconds", coef_seconds_fast);

    /* Do processing to set clock.  Let R be the value we set the
       RTC to, then in 500ms the RTC ticks (R+1) (see comments in
       arch/i386/kernel/time.c about the behaviour of the real time
       clock chip).  If S is the system time now, the error at the
       next RTC tick is given by E = (R+1) - (S+0.5).  Ideally we
       want |E| <= 0.5, which implies R <= S <= R+1, i.e. R is just
       the rounded down part of S, i.e. the seconds part. */

    LCL_ReadCookedTime(&now, &local_clock_err);
    
    set_rtc(now.tv_sec);

    /* All old samples will now look bogus under the new
           regime. */
    n_samples = 0;
    operating_mode = OM_AFTERTRIM;

    /* And start rapid sampling, interrupts on now */
    if (timeout_running) {
      SCH_RemoveTimeout(timeout_id);
      timeout_running = 0;
    }
    switch_interrupts(1);
  }

  return 1;
  
}

/* ================================================== */

void
RTC_Linux_CycleLogFile(void)
{
  if (logfile && logfilename) {
    fclose(logfile);
    logfile = fopen(logfilename, "a");
    if (!logfile) {
      LOG(LOGS_WARN, LOGF_RtcLinux, "Could not reopen logfile %s", logfilename);
    }
    logwrites = 0;
  }
}

/* ================================================== */

#endif /* defined LINUX */
