/*
  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2003
 * Copyright (C) Miroslav Lichvar  2011-2013
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
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 * 
 **********************************************************************

  =======================================================================

  The routines in this file manage the complete pool of sources that
  we might be synchronizing to.  This includes NTP sources and others
  (e.g. local reference clocks, eyeball + wristwatch etc).

  */

#include "config.h"

#include "sysincl.h"

#include "sources.h"
#include "sourcestats.h"
#include "memory.h"
#include "ntp.h" /* For NTP_Leap */
#include "local.h"
#include "reference.h"
#include "util.h"
#include "conf.h"
#include "logging.h"
#include "reports.h"
#include "nameserv.h"
#include "mkdirpp.h"
#include "sched.h"

/* ================================================== */
/* Flag indicating that we are initialised */
static int initialised = 0;

/* ================================================== */
/* Structure used to hold info for selecting between sources */
struct SelectInfo {
  int stratum;
  int select_ok;
  double variance;
  double root_distance;
  double lo_limit;
  double hi_limit;
};

/* ================================================== */
/* This enum contains the flag values that are used to label
   each source */
typedef enum {
  SRC_OK,                       /* OK so far */
  SRC_UNREACHABLE,              /* Source is not reachable */
  SRC_BAD_STATS,                /* Stats driver could not supply valid
                                   data */
  SRC_FALSETICKER,              /* Source is found to be a falseticker */
  SRC_JITTERY,                  /* Source scatter worse than other's dispersion */
  SRC_SELECTABLE,               /* Source is acceptable candidate */
  SRC_SYNC                      /* Current synchronisation source */
} SRC_Status;

/* ================================================== */
/* Define the instance structure used to hold information about each
   source */
struct SRC_Instance_Record {
  SST_Stats stats;
  NTP_Leap leap_status;         /* Leap status */
  int index;                    /* Index back into the array of source */
  uint32_t ref_id;              /* The reference ID of this source
                                   (i.e. from its IP address, NOT the
                                   reference _it_ is sync'd to) */
  IPAddr *ip_addr;              /* Its IP address if NTP source */

  /* Flag indicating that we can use this source as a reference */
  int selectable;

  /* Reachability register */
  int reachability;

  /* Flag indicating that only few samples were accumulated so far */
  int beginning;

  /* Updates left before allowing combining */
  int outlier;

  /* Flag indicating the status of the source */
  SRC_Status status;

  /* Type of the source */
  SRC_Type type;

  /* Options used when selecting sources */ 
  SRC_SelectOption sel_option;

  /* Score against currently selected source */
  double sel_score;

  struct SelectInfo sel_info;
};

/* ================================================== */
/* Structure used to build the sort list for finding falsetickers */
struct Sort_Element {
  int index;
  double offset;
  enum {LOW=-1, CENTRE=0, HIGH=1} tag;
};

/* ================================================== */
/* Table of sources */
static struct SRC_Instance_Record **sources;
static struct Sort_Element *sort_list;
static int *sel_sources;
static int n_sources; /* Number of sources currently in the table */
static int max_n_sources; /* Capacity of the table */

#define INVALID_SOURCE (-1)
static int selected_source_index; /* Which source index is currently
                                     selected (set to INVALID_SOURCE
                                     if no current valid reference) */

/* Keep reachability status for last 8 samples */
#define REACH_BITS 8

/* Score needed to replace the currently selected source */
#define SCORE_LIMIT 10.0

/* Number of updates needed to reset the outlier status */
#define OUTLIER_PENALTY 32

static double reselect_distance;
static double stratum_weight;
static double combine_limit;

/* ================================================== */
/* Forward prototype */

static void
slew_sources(struct timeval *raw, struct timeval *cooked, double dfreq,
             double doffset, int is_step_change, void *anything);
static void
add_dispersion(double dispersion, void *anything);
static char *
source_to_string(SRC_Instance inst);

/* ================================================== */
/* Initialisation function */
void SRC_Initialise(void) {
  sources = NULL;
  sort_list = NULL;
  n_sources = 0;
  max_n_sources = 0;
  selected_source_index = INVALID_SOURCE;
  reselect_distance = CNF_GetReselectDistance();
  stratum_weight = CNF_GetStratumWeight();
  combine_limit = CNF_GetCombineLimit();
  initialised = 1;

  LCL_AddParameterChangeHandler(slew_sources, NULL);
  LCL_AddDispersionNotifyHandler(add_dispersion, NULL);
}

/* ================================================== */
/* Finalisation function */
void SRC_Finalise(void)
{
  LCL_RemoveParameterChangeHandler(slew_sources, NULL);
  LCL_RemoveDispersionNotifyHandler(add_dispersion, NULL);
  initialised = 0;
}

/* ================================================== */
/* Function to create a new instance.  This would be called by one of
   the individual source-type instance creation routines. */

SRC_Instance SRC_CreateNewInstance(uint32_t ref_id, SRC_Type type, SRC_SelectOption sel_option, IPAddr *addr)
{
  SRC_Instance result;

  assert(initialised);

  result = MallocNew(struct SRC_Instance_Record);
  result->stats = SST_CreateInstance(ref_id, addr);

  if (n_sources == max_n_sources) {
    /* Reallocate memory */
    max_n_sources += 32;
    if (sources) {
      sources = ReallocArray(struct SRC_Instance_Record *, max_n_sources, sources);
      sort_list = ReallocArray(struct Sort_Element, 3*max_n_sources, sort_list);
      sel_sources = ReallocArray(int, max_n_sources, sel_sources);
    } else {
      sources = MallocArray(struct SRC_Instance_Record *, max_n_sources);
      sort_list = MallocArray(struct Sort_Element, 3*max_n_sources);
      sel_sources = MallocArray(int, max_n_sources);
    }
  }

  sources[n_sources] = result;
  result->index = n_sources;
  result->leap_status = LEAP_Normal;
  result->ref_id = ref_id;
  result->ip_addr = addr;
  result->selectable = 0;
  result->reachability = 0;
  result->beginning = 1;
  result->outlier = 0;
  result->status = SRC_BAD_STATS;
  result->type = type;
  result->sel_score = 1.0;
  result->sel_option = sel_option;

  n_sources++;

  return result;
}

/* ================================================== */
/* Function to get rid of a source when it is being unconfigured.
   This may cause the current reference source to be reselected, if this
   was the reference source or contributed significantly to a
   falseticker decision. */

void SRC_DestroyInstance(SRC_Instance instance)
{
  int dead_index, i;

  assert(initialised);

  SRC_UnsetSelectable(instance);

  SST_DeleteInstance(instance->stats);
  dead_index = instance->index;
  for (i=dead_index; i<n_sources-1; i++) {
    sources[i] = sources[i+1];
    sources[i]->index = i;
  }
  --n_sources;
  Free(instance);

  if (selected_source_index > dead_index) {
    --selected_source_index;
  }
}

/* ================================================== */
/* Function to get the range of frequencies, relative to the given
   source, that we believe the local clock lies within.  The return
   values are in terms of the number of seconds fast (+ve) or slow
   (-ve) relative to the source that the local clock becomes after a
   given amount of local time has elapsed.

   Suppose the initial offset relative to the source is U (fast +ve,
   slow -ve) and a time interval T elapses measured in terms of the
   local clock.  Then the error relative to the source at the end of
   the interval should lie in the interval [U+T*lo, U+T*hi]. */

void SRC_GetFrequencyRange(SRC_Instance instance, double *lo, double *hi)
{
  assert(initialised);

  SST_GetFrequencyRange(instance->stats, lo, hi);
}

/* ================================================== */

/* This function is called by one of the source drivers when it has
   a new sample that is to be accumulated.

   This function causes the frequency estimation to be re-run for the
   designated source, and the clock selection procedure to be re-run
   afterwards.

   Parameters are described in sources.h

   */

void SRC_AccumulateSample
(SRC_Instance inst, 
 struct timeval *sample_time, 
 double offset, 
 double peer_delay,
 double peer_dispersion,
 double root_delay, 
 double root_dispersion, 
 int stratum,
 NTP_Leap leap_status)
{

  assert(initialised);

  inst->leap_status = leap_status;

#ifdef TRACEON
  LOG(LOGS_INFO, LOGF_Sources, "ip=[%s] t=%s ofs=%f del=%f disp=%f str=%d",
      source_to_string(inst), UTI_TimevalToString(sample_time), -offset, root_delay, root_dispersion, stratum);
#endif

  /* WE HAVE TO NEGATE OFFSET IN THIS CALL, IT IS HERE THAT THE SENSE OF OFFSET
     IS FLIPPED */
  SST_AccumulateSample(inst->stats, sample_time, -offset, peer_delay, peer_dispersion, root_delay, root_dispersion, stratum);
  SST_DoNewRegression(inst->stats);
  /* And redo clock selection */
  SRC_SelectSource(inst->ref_id);
}

/* ================================================== */

void
SRC_SetSelectable(SRC_Instance inst)
{
  inst->selectable = 1;

#ifdef TRACEON
  LOG(LOGS_INFO, LOGF_Sources, "%s", source_to_string(inst));
#endif

  /* Don't do selection at this point, though - that will come about
     in due course when we get some useful data from the source */
}

/* ================================================== */

void
SRC_UnsetSelectable(SRC_Instance inst)
{
  inst->selectable = 0;

#ifdef TRACEON
  LOG(LOGS_INFO, LOGF_Sources, "%s%s", source_to_string(inst),
      (inst->index == selected_source_index) ? "(REF)":"");
#endif

  /* If this was the previous reference source, we have to reselect!  */

  if (inst->index == selected_source_index) {
    SRC_SelectSource(0);
  }

}

/* ================================================== */

void
SRC_UpdateReachability(SRC_Instance inst, int reachable)
{
  inst->reachability <<= 1;
  inst->reachability |= !!reachable;
  inst->reachability &= ~(-1 << REACH_BITS);

  /* The beginning is over when the first sample is at the end of the register */
  if (inst->reachability & (1 << (REACH_BITS - 1)))
      inst->beginning = 0;

  if (!reachable && inst->index == selected_source_index) {
    /* Try to select a better source */
    SRC_SelectSource(0);
  }
}

/* ================================================== */

void
SRC_ResetReachability(SRC_Instance inst)
{
  /* This should be disabled until source selection is modified to keep
     a peer selected even when not reachable */
#if 0
  inst->reachability = 0;
  SRC_UpdateReachability(inst, 0);
#endif
}

/* ================================================== */

static int
compare_sort_elements(const void *a, const void *b)
{
  const struct Sort_Element *u = (const struct Sort_Element *) a;
  const struct Sort_Element *v = (const struct Sort_Element *) b;

  if (u->offset < v->offset) {
    return -1;
  } else if (u->offset > v->offset) {
    return +1;
  } else if (u->tag < v->tag) {
    return -1;
  } else if (u->tag > v->tag) {
    return +1;
  } else {
    return 0;
  }
}

/* ================================================== */

static char *
source_to_string(SRC_Instance inst)
{
  switch (inst->type) {
    case SRC_NTP:
      return UTI_IPToString(inst->ip_addr);
    case SRC_REFCLOCK:
      return UTI_RefidToString(inst->ref_id);
    default:
      assert(0);
  }
  return NULL;
}

/* ================================================== */

static int
combine_sources(int n_sel_sources, struct timeval *ref_time, double *offset,
                double *offset_sd, double *frequency, double *skew)
{
  struct timeval src_ref_time;
  double src_offset, src_offset_sd, src_frequency, src_skew;
  double src_root_delay, src_root_dispersion, elapsed;
  double offset_weight, sum_offset_weight, sum_offset, sum2_offset_sd;
  double frequency_weight, sum_frequency_weight, sum_frequency, inv_sum2_skew;
  int i, index, combined;

  if (n_sel_sources == 1)
    return 1;

  sum_offset_weight = sum_offset = sum2_offset_sd = 0.0;
  sum_frequency_weight = sum_frequency = inv_sum2_skew = 0.0;

  for (i = combined = 0; i < n_sel_sources; i++) {
    index = sel_sources[i];
    SST_GetTrackingData(sources[index]->stats, &src_ref_time,
                        &src_offset, &src_offset_sd,
                        &src_frequency, &src_skew,
                        &src_root_delay, &src_root_dispersion);

    /* Don't include this source if its distance is longer than the distance of
       the selected source multiplied by the limit, their estimated frequencies
       are not close, or it was recently marked as outlier */

    if (index != selected_source_index &&
        (sources[index]->sel_info.root_distance > combine_limit *
           (reselect_distance + sources[selected_source_index]->sel_info.root_distance) ||
         fabs(*frequency - src_frequency) >
           combine_limit * (*skew + src_skew + LCL_GetMaxClockError()))) {
      sources[index]->outlier = !sources[index]->beginning ? OUTLIER_PENALTY : 1;
    } else if (sources[index]->outlier) {
      sources[index]->outlier--;
    }

    if (sources[index]->outlier)
      continue;

    UTI_DiffTimevalsToDouble(&elapsed, ref_time, &src_ref_time);
    src_offset += elapsed * src_frequency;
    offset_weight = 1.0 / sources[index]->sel_info.root_distance;
    frequency_weight = 1.0 / src_skew;

#ifdef TRACEON
    LOG(LOGS_INFO, LOGF_Sources, "combining index=%d oweight=%e offset=%e sd=%e fweight=%e freq=%e skew=%e",
        index, offset_weight, src_offset, src_offset_sd, frequency_weight, src_frequency, src_skew);
#endif

    sum_offset_weight += offset_weight;
    sum_offset += offset_weight * src_offset;
    sum2_offset_sd += offset_weight * (src_offset_sd * src_offset_sd +
        (src_offset - *offset) * (src_offset - *offset));

    sum_frequency_weight += frequency_weight;
    sum_frequency += frequency_weight * src_frequency;
    inv_sum2_skew += 1.0 / (src_skew * src_skew);

    combined++;
  }

  assert(combined);
  *offset = sum_offset / sum_offset_weight;
  *offset_sd = sqrt(sum2_offset_sd / sum_offset_weight);
  *frequency = sum_frequency / sum_frequency_weight;
  *skew = 1.0 / sqrt(inv_sum2_skew);

#ifdef TRACEON
  LOG(LOGS_INFO, LOGF_Sources, "combined result offset=%e sd=%e freq=%e skew=%e",
      *offset, *offset_sd, *frequency, *skew);
#endif

  return combined;
}

/* ================================================== */
/* This function selects the current reference from amongst the pool
   of sources we are holding. 
   
   Updates are only made to the local reference if a new source is selected
   or match_refid is equal to the selected reference source refid */

void
SRC_SelectSource(uint32_t match_refid)
{
  int i, j, index, old_selected_index;
  struct timeval now, ref_time;
  double src_offset, src_offset_sd, src_frequency, src_skew;
  double src_root_delay, src_root_dispersion;
  int n_endpoints, j1, j2;
  double best_lo, best_hi;
  int depth, best_depth;
  int n_sel_sources, combined;
  double distance, sel_src_distance;
  int stratum, min_stratum;
  struct SelectInfo *si;
  int n_badstats_sources;
  int max_sel_reach, max_badstat_reach;
  int max_score_index;
  double max_score;

  NTP_Leap leap_status = LEAP_Normal;
  old_selected_index = selected_source_index;

  if (n_sources == 0) {
    /* In this case, we clearly cannot synchronise to anything */
    if (selected_source_index != INVALID_SOURCE) {
      LOG(LOGS_INFO, LOGF_Sources, "Can't synchronise: no sources");
      selected_source_index = INVALID_SOURCE;
      REF_SetUnsynchronised();
    }
    return;
  }

  /* This is accurate enough and cheaper than calling LCL_ReadCookedTime */
  SCH_GetLastEventTime(&now, NULL, NULL);

  /* Step 1 - build intervals about each source */
  n_endpoints = 0;
  n_sel_sources = 0;
  n_badstats_sources = 0;
  max_sel_reach = max_badstat_reach = 0;
  for (i=0; i<n_sources; i++) {

    if (sources[i]->selectable && sources[i]->reachability &&
        sources[i]->sel_option != SRC_SelectNoselect) {

      si = &(sources[i]->sel_info);
      SST_GetSelectionData(sources[i]->stats, &now,
                           &(si->stratum),
                           &(si->lo_limit),
                           &(si->hi_limit),
                           &(si->root_distance),
                           &(si->variance),
                           &(si->select_ok));

#if 0
      LOG(LOGS_INFO, LOGF_Sources, "%s dist=%f lo=%f hi=%f",
          source_to_string(sources[i]),
          si->root_distance,
          si->lo_limit, si->hi_limit);
#endif
      
      if (si->select_ok) {
        ++n_sel_sources;

        sources[i]->status = SRC_OK; /* For now */

        /* Otherwise it will be hard to pick this one later!  However,
           this test might be too strict, we might want to dump it */
        j1 = n_endpoints;
        j2 = j1 + 1;

        sort_list[j1].index = i;
        sort_list[j1].offset = si->lo_limit;
        sort_list[j1].tag = LOW;

        sort_list[j2].index = i;
        sort_list[j2].offset = si->hi_limit;
        sort_list[j2].tag = HIGH;

        n_endpoints += 2;

        if (max_sel_reach < sources[i]->reachability) {
          max_sel_reach = sources[i]->reachability;
        }
      } else {
        ++n_badstats_sources;
        sources[i]->status = SRC_BAD_STATS;

        if (max_badstat_reach < sources[i]->reachability) {
          max_badstat_reach = sources[i]->reachability;
        }
      }
    } else {
      /* If the source is not reachable, there is no way we will pick
         it. */
      sources[i]->status = SRC_UNREACHABLE;
    }
  }

#if 0
  LOG(LOGS_INFO, LOGF_Sources, "badstat_sources=%d sel_sources=%d badstat_reach=%x sel_reach=%x",
      n_badstats_sources, n_sel_sources, max_badstat_reach, max_sel_reach);
#endif

  /* Wait for the next call if we have no source selected and there is
     a source with bad stats (has less than 3 samples) with reachability
     equal to shifted maximum reachability of sources with valid stats.
     This delays selecting source on start with servers using the same
     polling interval until they all have valid stats. */

  if (n_badstats_sources && n_sel_sources &&
      selected_source_index == INVALID_SOURCE && 
      max_sel_reach >> 1 == max_badstat_reach) {
    return;
  }

#if 0
  LOG(LOGS_INFO, LOGF_Sources, "n_endpoints=%d", n_endpoints);
#endif

  /* Now sort the endpoint list */
  if (n_endpoints > 0) {

    /* Sort the list into order */
    qsort((void *) sort_list, n_endpoints, sizeof(struct Sort_Element), compare_sort_elements);
    
    /* Now search for the interval which is contained in the most
       individual source intervals.  Any source which overlaps this
       will be a candidate.

       If we get a case like

       <----------------------->
           <-->   
                    <-->
           <===========>

       we will build the interval as shown with '=', whereas with an extra source we get
       <----------------------->
          <------->
           <-->
                    <-->
           <==>

       The first case is just bad luck - we need extra sources to
       detect the falseticker, so just make an arbitrary choice based
       on stratum & stability etc.
       */

    depth = best_depth = 0;
    best_lo = best_hi = 0.0;

    for (i=0; i<n_endpoints; i++) {
#if 0
      LOG(LOGS_INFO, LOGF_Sources, "i=%d t=%f tag=%d addr=%s", i, sort_list[i].offset, sort_list[i].tag,
          source_to_string(sources[sort_list[i].index]));
#endif
      switch(sort_list[i].tag) {
        case LOW:
          depth++;
          if (depth > best_depth) {
            best_depth = depth;
            best_lo = sort_list[i].offset;
          }
          break;

        case CENTRE:
          assert(0);
          break;

        case HIGH:
          if (depth == best_depth) {
            best_hi = sort_list[i].offset;
          }
          depth--;
          break;

      }
    }

#if 0
    LOG(LOGS_INFO, LOGF_Sources, "best_depth=%d best_lo=%f best_hi=%f",
        best_depth, best_lo, best_hi);
#endif

    if (best_depth <= n_sel_sources/2) {
      /* Could not even get half the reachable sources to agree -
         clearly we can't synchronise.

         srcs     #to agree
           1          1
           2          2
           3          2
           4          3 etc

           */

      if (selected_source_index != INVALID_SOURCE) {
        LOG(LOGS_INFO, LOGF_Sources, "Can't synchronise: no majority");
      }
      selected_source_index = INVALID_SOURCE;

      /* .. and mark all sources as falsetickers (so they appear thus
         on the outputs from the command client) */

      for (i=0; i<n_sources; i++) {
        sources[i]->status = SRC_FALSETICKER;
      }

    } else {
      
      /* We have our interval, now work out which source are in it,
         i.e. build list of admissible sources. */
      
      n_sel_sources = 0;
      for (i=0; i<n_sources; i++) {
        if (sources[i]->status == SRC_OK) {
          /* This should be the same condition to get into the endpoint
             list */
          /* Check if source's interval contains the best interval, or
             is wholly contained within it */
          if (((sources[i]->sel_info.lo_limit <= best_lo) &&
               (sources[i]->sel_info.hi_limit >= best_hi)) ||
              ((sources[i]->sel_info.lo_limit >= best_lo) &&
               (sources[i]->sel_info.hi_limit <= best_hi))) {

            sel_sources[n_sel_sources++] = i;
#if 0
            LOG(LOGS_INFO, LOGF_Sources, "i=%d addr=%s is valid", i, source_to_string(sources[i]));
#endif
          } else {
            sources[i]->status = SRC_FALSETICKER;
#if 0
            LOG(LOGS_INFO, LOGF_Sources, "i=%d addr=%s is a falseticker", i, source_to_string(sources[i]));
#endif
          }
        }
      }

#if 0
      /* We now have a list of indices for the sources which pass the
         false-ticker test.  Now go on to reject those whose variance is
         greater than the minimum distance of any other */

      /* Find minimum distance */
      index = sel_sources[0];
      min_distance = sources[index]->sel_info.root_distance;
      for (i=1; i<n_sel_sources; i++) {
        index = sel_sources[i];
        distance = sources[index]->sel_info.root_distance;
        if (distance < min_distance) {
          min_distance = distance;
        }
      }

#if 0
      LOG(LOGS_INFO, LOGF_Sources, "min_distance=%f", min_distance);
#endif

      /* Now go through and prune any NTP sources that have excessive
         variance */
      for (i=0; i<n_sel_sources; i++) {
        index = sel_sources[i];
        if (sources[index]->type == SRC_NTP &&
            sqrt(sources[index]->sel_info.variance) > min_distance) {
          sel_sources[i] = INVALID_SOURCE;
          sources[index]->status = SRC_JITTERY;
#if 0
          LOG(LOGS_INFO, LOGF_Sources, "i=%d addr=%s has too much variance", i, source_to_string(sources[i]));
#endif
        }
      }
#endif

      /* Now crunch the list and mark all sources as selectable */
      for (i=j=0; i<n_sel_sources; i++) {
        index = sel_sources[i];
        if (index != INVALID_SOURCE) {
          sources[index]->status = SRC_SELECTABLE;
          sel_sources[j++] = sel_sources[i];
          index++;
        }
      }
      n_sel_sources = j;

      if (n_sel_sources > 0) {
        /* Accept leap second status if more than half of selectable sources agree */

        for (i=j1=j2=0; i<n_sel_sources; i++) {
          index = sel_sources[i];
          if (sources[index]->leap_status == LEAP_InsertSecond) {
            j1++;
          } else if (sources[index]->leap_status == LEAP_DeleteSecond) {
            j2++;
          }
        }

        if (j1 > n_sel_sources / 2) {
          leap_status = LEAP_InsertSecond;
        } else if (j2 > n_sel_sources / 2) {
          leap_status = LEAP_DeleteSecond;
        }

        /* If there are any sources with prefer option, reduce the list again
           only to the prefer sources */
        for (i=j=0; i<n_sel_sources; i++) {
          if (sources[sel_sources[i]]->sel_option == SRC_SelectPrefer) {
            sel_sources[j++] = sel_sources[i];
          }
        }
        if (j > 0) {
          n_sel_sources = j;
        }

        /* Now find minimum stratum.  If none are left now,
           tough. RFC1305 is not so harsh on pruning sources due to
           excess variance, which prevents this from happening */

        index = sel_sources[0];
        min_stratum = sources[index]->sel_info.stratum;
        for (i=1; i<n_sel_sources; i++) {
          index = sel_sources[i];
          stratum = sources[index]->sel_info.stratum;
          if (stratum < min_stratum) min_stratum = stratum;
        }

#if 0
        LOG(LOGS_INFO, LOGF_Sources, "min_stratum=%d", min_stratum);
#endif

        /* Update scores and find source with maximum score */

        max_score_index = INVALID_SOURCE;
        max_score = 0.0;
        sel_src_distance = 0.0;

        if (selected_source_index != INVALID_SOURCE) {
          sel_src_distance = sources[selected_source_index]->sel_info.root_distance +
            (sources[selected_source_index]->sel_info.stratum - min_stratum) * stratum_weight;
        }

        for (i = 0; i < n_sources; i++) {

          /* Reset score for non-selectable sources */
          if (sources[i]->status != SRC_SELECTABLE) {
            sources[i]->sel_score = 1.0;
            sources[i]->outlier = OUTLIER_PENALTY;
            continue;
          }
            
          distance = sources[i]->sel_info.root_distance +
            (sources[i]->sel_info.stratum - min_stratum) * stratum_weight;
          if (sources[i]->type == SRC_NTP)
            distance += reselect_distance;

          if (selected_source_index != INVALID_SOURCE) {

            /* Update score, but only for source pairs where one source
               has a new sample */
            if (sources[i]->ref_id == match_refid ||
                sources[selected_source_index]->ref_id == match_refid) {

              sources[i]->sel_score *= sel_src_distance / distance;

              if (sources[i]->sel_score < 1.0)
                sources[i]->sel_score = 1.0;
            }

          } else {

            /* When there is no selected source yet, assign scores so the
               source with minimum distance will have maximum score. The scores
               will be immediately reset. */

            sources[i]->sel_score = 1.0 / distance; 
          }

#if 0
          LOG(LOGS_INFO, LOGF_Sources, "select score=%f refid=%lx match_refid=%lx status=%d dist=%f",
              sources[i]->sel_score, sources[i]->ref_id, match_refid, sources[i]->status, distance);
#endif
        
          if (max_score < sources[i]->sel_score) {
            max_score = sources[i]->sel_score;
            max_score_index = i;
          }
        }

        assert(max_score_index != INVALID_SOURCE);

        /* Is the current source still a survivor
           and no other source has reached the score limit? */

        if ((selected_source_index == INVALID_SOURCE) ||
            (sources[selected_source_index]->status != SRC_SELECTABLE) ||
            (max_score_index != selected_source_index && max_score > SCORE_LIMIT)) {
          
          /* We have to elect a new synchronisation source */

          selected_source_index = max_score_index;
          LOG(LOGS_INFO, LOGF_Sources, "Selected source %s",
                source_to_string(sources[selected_source_index]));
                                 
#if 0
          LOG(LOGS_INFO, LOGF_Sources, "new_sel_index=%d", selected_source_index);
#endif

          /* New source has been selected, reset all scores */
          for (i=0; i < n_sources; i++) {
            sources[i]->sel_score = 1.0;
            sources[i]->outlier = 0;
          }
        }

        sources[selected_source_index]->status = SRC_SYNC;

        /* Update local reference only when a new source was selected or a new
           sample was received (i.e. match_refid is equal to selected refid) */
        if (selected_source_index != old_selected_index ||
            match_refid == sources[selected_source_index]->ref_id) {

          /* Now just use the statistics of the selected source combined with
             the other selectable sources for trimming the local clock */

          SST_GetTrackingData(sources[selected_source_index]->stats, &ref_time,
                              &src_offset, &src_offset_sd,
                              &src_frequency, &src_skew,
                              &src_root_delay, &src_root_dispersion);

          combined = combine_sources(n_sel_sources, &ref_time, &src_offset,
                                     &src_offset_sd, &src_frequency, &src_skew);

          REF_SetReference(sources[selected_source_index]->sel_info.stratum,
                           leap_status,
                           combined,
                           sources[selected_source_index]->ref_id,
                           sources[selected_source_index]->ip_addr,
                           &ref_time,
                           src_offset,
                           src_offset_sd,
                           src_frequency,
                           src_skew,
                           src_root_delay,
                           src_root_dispersion);
        }

      } else {
        if (selected_source_index != INVALID_SOURCE) {
          LOG(LOGS_INFO, LOGF_Sources, "Can't synchronise: no selectable sources");
        }
        selected_source_index = INVALID_SOURCE;
      }
    }

  } else {
    /* No sources provided valid endpoints */
    if (selected_source_index != INVALID_SOURCE) {
      LOG(LOGS_INFO, LOGF_Sources, "Can't synchronise: no reachable sources");
    }
    selected_source_index = INVALID_SOURCE;
  }

  if (selected_source_index == INVALID_SOURCE &&
      selected_source_index != old_selected_index) {
    REF_SetUnsynchronised();
  }
}

/* ================================================== */
/* Force reselecting the best source */

void
SRC_ReselectSource(void)
{
  selected_source_index = INVALID_SOURCE;
  SRC_SelectSource(0);
}

/* ================================================== */

void
SRC_SetReselectDistance(double distance)
{
  if (reselect_distance != distance) {
    reselect_distance = distance;
    LOG(LOGS_INFO, LOGF_Sources, "New reselect distance %f", distance);
  }
}

/* ================================================== */

double
SRC_PredictOffset(SRC_Instance inst, struct timeval *when)
{
  return SST_PredictOffset(inst->stats, when);
}

/* ================================================== */

double
SRC_MinRoundTripDelay(SRC_Instance inst)
{
  return SST_MinRoundTripDelay(inst->stats);
}

/* ================================================== */

int
SRC_IsGoodSample(SRC_Instance inst, double offset, double delay,
   double max_delay_dev_ratio, double clock_error, struct timeval *when)
{
  return SST_IsGoodSample(inst->stats, offset, delay, max_delay_dev_ratio,
      clock_error, when);
}

/* ================================================== */
/* This routine is registered as a callback with the local clock
   module, to be called whenever the local clock changes frequency or
   is slewed.  It runs through all the existing source statistics, and
   adjusts them to make them look as though they were sampled under
   the new regime. */

static void
slew_sources(struct timeval *raw,
             struct timeval *cooked,
             double dfreq,
             double doffset,
             int is_step_change,
             void *anything)
{
  int i;

  for (i=0; i<n_sources; i++) {
    SST_SlewSamples(sources[i]->stats, cooked, dfreq, doffset);
  }
  
}

/* ================================================== */
/* This routine is called when an indeterminate offset is introduced
   into the local time. */

static void
add_dispersion(double dispersion, void *anything)
{
  int i;

  for (i = 0; i < n_sources; i++) {
    SST_AddDispersion(sources[i]->stats, dispersion);
  }
}

/* ================================================== */
/* This is called to dump out the source measurement registers */

void
SRC_DumpSources(void)
{
  FILE *out;
  int direc_len, file_len;
  char *filename;
  unsigned int a, b, c, d;
  int i;
  char *direc;

  direc = CNF_GetDumpDir();
  direc_len = strlen(direc);
  file_len = direc_len + 24;
  filename = MallocArray(char, file_len); /* a bit of slack */
  if (mkdir_and_parents(direc)) {
    for (i=0; i<n_sources; i++) {
      a = (sources[i]->ref_id) >> 24;
      b = ((sources[i]->ref_id) >> 16) & 0xff;
      c = ((sources[i]->ref_id) >> 8) & 0xff;
      d = ((sources[i]->ref_id)) & 0xff;
      
      snprintf(filename, file_len-1, "%s/%d.%d.%d.%d.dat", direc, a, b, c, d);
      out = fopen(filename, "w");
      if (!out) {
        LOG(LOGS_WARN, LOGF_Sources, "Could not open dump file %s", filename);
      } else {
        SST_SaveToFile(sources[i]->stats, out);
        fclose(out);
      }
    }
  } else {
    LOG(LOGS_ERR, LOGF_Sources, "Could not create directory %s", direc);
  }
  Free(filename);
}

/* ================================================== */

void
SRC_ReloadSources(void)
{
  FILE *in;
  char *filename;
  unsigned int a, b, c, d;
  int i;
  char *dumpdir;
  int dumpdirlen, filelen;

  for (i=0; i<n_sources; i++) {
    a = (sources[i]->ref_id) >> 24;
    b = ((sources[i]->ref_id) >> 16) & 0xff;
    c = ((sources[i]->ref_id) >> 8) & 0xff;
    d = ((sources[i]->ref_id)) & 0xff;

    dumpdir = CNF_GetDumpDir();
    dumpdirlen = strlen(dumpdir);
    filelen = dumpdirlen + 24;
    filename = MallocArray(char, filelen);
    snprintf(filename, filelen-1, "%s/%d.%d.%d.%d.dat", dumpdir, a, b, c, d);
    in = fopen(filename, "r");
    if (!in) {
      LOG(LOGS_WARN, LOGF_Sources, "Could not open dump file %s", filename);
    } else {
      if (SST_LoadFromFile(sources[i]->stats, in)) {
        SST_DoNewRegression(sources[i]->stats);
      } else {
        LOG(LOGS_WARN, LOGF_Sources, "Problem loading from file %s", filename);
      }
      fclose(in);
    }
    Free(filename);
  }
}

/* ================================================== */

int
SRC_IsSyncPeer(SRC_Instance inst)
{
  if (inst->index == selected_source_index) {
    return 1;
  } else {
    return 0;
  }

}

/* ================================================== */

int
SRC_ReadNumberOfSources(void)
{
  return n_sources;
}

/* ================================================== */

int
SRC_ReportSource(int index, RPT_SourceReport *report, struct timeval *now)
{
  SRC_Instance src;
  if ((index >= n_sources) || (index < 0)) {
    return 0;
  } else {
    src = sources[index];

    memset(&report->ip_addr, 0, sizeof (report->ip_addr));
    if (src->ip_addr)
      report->ip_addr = *src->ip_addr;
    else {
      /* Use refid as an address */
      report->ip_addr.addr.in4 = src->ref_id;
      report->ip_addr.family = IPADDR_INET4;
    }

    switch (src->status) {
      case SRC_SYNC:
        report->state = RPT_SYNC;
        break;
      case SRC_JITTERY:
        report->state = RPT_JITTERY;
        break;
      case SRC_OK:
      case SRC_BAD_STATS:
      case SRC_UNREACHABLE:
        report->state = RPT_UNREACH;
        break;
      case SRC_FALSETICKER:
        report->state = RPT_FALSETICKER;
        break;
      case SRC_SELECTABLE:
        report->state = src->outlier ? RPT_OUTLIER : RPT_CANDIDATE;
        break;
      default:
        assert(0);
        break;
    }

    switch (src->sel_option) {
      case SRC_SelectNormal:
        report->sel_option = RPT_NOSELECT;
        break;
      case SRC_SelectPrefer:
        report->sel_option = RPT_PREFER;
        break;
      case SRC_SelectNoselect:
        report->sel_option = RPT_NOSELECT;
        break;
      default:
        assert(0);
    }

    report->reachability = src->reachability;

    /* Call stats module to fill out estimates */
    SST_DoSourceReport(src->stats, report, now);

    return 1;
  }

}

/* ================================================== */

int
SRC_ReportSourcestats(int index, RPT_SourcestatsReport *report, struct timeval *now)
{ 
  SRC_Instance src;

  if ((index >= n_sources) || (index < 0)) {
    return 0;
  } else {
    src = sources[index];
    report->ref_id = src->ref_id;
    if (src->ip_addr)
      report->ip_addr = *src->ip_addr;
    else
      report->ip_addr.family = IPADDR_UNSPEC; 
    SST_DoSourcestatsReport(src->stats, report, now);
    return 1;
  }
}

/* ================================================== */

SRC_Type
SRC_GetType(int index)
{
  if ((index >= n_sources) || (index < 0))
    return -1;
  return sources[index]->type;
}

/* ================================================== */

SRC_Skew_Direction SRC_LastSkewChange(SRC_Instance inst)
{
  SRC_Skew_Direction result = SRC_Skew_Nochange;
  
  switch (SST_LastSkewChange(inst->stats)) {
    case SST_Skew_Decrease:
      result = SRC_Skew_Decrease;
      break;
    case SST_Skew_Nochange:
      result = SRC_Skew_Nochange;
      break;
    case SST_Skew_Increase:
      result = SRC_Skew_Increase;
      break;
  }

  return result;
}

/* ================================================== */

int
SRC_Samples(SRC_Instance inst)
{
  return SST_Samples(inst->stats);
}

/* ================================================== */
