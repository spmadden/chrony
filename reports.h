/*
  $Header: /cvs/src/chrony/reports.h,v 1.17 2002/02/28 23:27:13 richard Exp $

  =======================================================================

  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2002
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

  Data structure definitions within the daemon for various reports that
  can be generated */

#ifndef GOT_REPORTS_H
#define GOT_REPORTS_H

#include "sysincl.h"

#define REPORT_INVALID_OFFSET 0x80000000

typedef struct {
  unsigned long ip_addr;
  int stratum;
  int poll;
  enum {RPT_NTP_CLIENT, RPT_NTP_PEER, RPT_LOCAL_REFERENCE} mode;
  enum {RPT_SYNC, RPT_UNREACH, RPT_FALSETICKER, RPT_JITTERY, RPT_OTHER} state;

  unsigned long latest_meas_ago; /* seconds */
  long orig_latest_meas; /* microseconds (us) */
  long latest_meas; /* us */
  unsigned long latest_meas_err; /* us */
  long est_offset; /* us */
  unsigned long est_offset_err; /* us */
  long resid_freq; /* ppm * 1000 */
  unsigned long resid_skew; /* ppm * 1000 */
} RPT_SourceReport ;

typedef struct {
  unsigned long ref_id;
  unsigned long stratum;
  struct timeval ref_time;
  struct timeval current_correction;
  double freq_ppm;
  double resid_freq_ppm;
  double skew_ppm;
  double root_delay;
  double root_dispersion;
} RPT_TrackingReport;

typedef struct {
  unsigned long ip_addr;
  unsigned long n_samples;
  unsigned long n_runs;
  unsigned long span_seconds;
  double resid_freq_ppm;
  double skew_ppm;
  double sd_us;
} RPT_SourcestatsReport;

typedef struct {
  unsigned long ref_time;
  unsigned short n_samples;
  unsigned short n_runs;
  unsigned long span_seconds;
  double rtc_seconds_fast;
  double rtc_gain_rate_ppm;
} RPT_RTC_Report;

typedef struct {
  unsigned long client_hits;
  unsigned long peer_hits;
  unsigned long cmd_hits_auth;
  unsigned long cmd_hits_normal;
  unsigned long cmd_hits_bad;
  unsigned long last_ntp_hit_ago;
  unsigned long last_cmd_hit_ago;
} RPT_ClientAccess_Report;

typedef struct {
  unsigned long ip_addr;
  unsigned long client_hits;
  unsigned long peer_hits;
  unsigned long cmd_hits_auth;
  unsigned long cmd_hits_normal;
  unsigned long cmd_hits_bad;
  unsigned long last_ntp_hit_ago;
  unsigned long last_cmd_hit_ago;
} RPT_ClientAccessByIndex_Report;

typedef struct {
  time_t when;
  double slewed_offset;
  double orig_offset;
  double residual;
} RPT_ManualSamplesReport;

typedef struct {
  int online;
  int offline;
  int burst_online;
  int burst_offline;
} RPT_ActivityReport;

#endif /* GOT_REPORTS_H */
