/*
  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2003
 * Copyright (C) Miroslav Lichvar  2011-2016
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
#include "ntp_sources.h"
#include "local.h"
#include "reference.h"
#include "util.h"
#include "conf.h"
#include "logging.h"
#include "reports.h"
#include "nameserv.h"
#include "sched.h"
#include "regress.h"

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
  double last_sample_ago;
};

/* ================================================== */
/* This enum contains the flag values that are used to label
   each source */
typedef enum {
  SRC_OK,               /* OK so far, not a final status! */
  SRC_UNSELECTABLE,     /* Has noselect option set */
  SRC_BAD_STATS,        /* Doesn't have valid stats data */
  SRC_BAD_DISTANCE,     /* Has root distance longer than allowed maximum */
  SRC_WAITS_STATS,      /* Others have bad stats, selection postponed */
  SRC_STALE,            /* Has older samples than others */
  SRC_ORPHAN,           /* Has stratum equal or larger than orphan stratum */
  SRC_FALSETICKER,      /* Doesn't agree with others */
  SRC_JITTERY,          /* Scatter worse than other's dispersion (not used) */
  SRC_WAITS_SOURCES,    /* Not enough sources, selection postponed */
  SRC_NONPREFERRED,     /* Others have prefer option */
  SRC_WAITS_UPDATE,     /* No updates, selection postponed */
  SRC_DISTANT,          /* Others have shorter root distance */
  SRC_OUTLIER,          /* Outlier in clustering (not used yet) */
  SRC_UNSELECTED,       /* Used for synchronisation, not system peer */
  SRC_SELECTED,         /* Used for synchronisation, selected as system peer */
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

  /* Flag indicating that the source is updating reachability */
  int active;

  /* Reachability register */
  int reachability;

  /* Number of set bits in the reachability register */
  int reachability_size;

  /* Updates since last reference update */
  int updates;

  /* Updates left before allowing combining */
  int distant;

  /* Flag indicating the status of the source */
  SRC_Status status;

  /* Type of the source */
  SRC_Type type;

  /* Options used when selecting sources */ 
  int sel_options;

  /* Score against currently selected source */
  double sel_score;

  struct SelectInfo sel_info;
};

/* ================================================== */
/* Structure used to build the sort list for finding falsetickers */
struct Sort_Element {
  int index;
  double offset;
  enum {
    LOW = -1,
    HIGH = 1
  } tag;
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

/* Score needed to replace the currently selected source */
#define SCORE_LIMIT 10.0

/* Number of updates needed to reset the distant status */
#define DISTANT_PENALTY 32

static double max_distance;
static double reselect_distance;
static double stratum_weight;
static double combine_limit;

/* ================================================== */
/* Forward prototype */

static void
slew_sources(struct timeval *raw, struct timeval *cooked, double dfreq,
             double doffset, LCL_ChangeType change_type, void *anything);
static void
add_dispersion(double dispersion, void *anything);
static char *
source_to_string(SRC_Instance inst);

/* ================================================== */
/* Initialisation function */
void SRC_Initialise(void) {
  sources = NULL;
  sort_list = NULL;
  sel_sources = NULL;
  n_sources = 0;
  max_n_sources = 0;
  selected_source_index = INVALID_SOURCE;
  max_distance = CNF_GetMaxDistance();
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

  Free(sources);
  Free(sort_list);
  Free(sel_sources);

  initialised = 0;
}

/* ================================================== */
/* Function to create a new instance.  This would be called by one of
   the individual source-type instance creation routines. */

SRC_Instance SRC_CreateNewInstance(uint32_t ref_id, SRC_Type type, int sel_options, IPAddr *addr, int min_samples, int max_samples)
{
  SRC_Instance result;

  assert(initialised);

  if (min_samples == SRC_DEFAULT_MINSAMPLES)
    min_samples = CNF_GetMinSamples();
  if (max_samples == SRC_DEFAULT_MAXSAMPLES)
    max_samples = CNF_GetMaxSamples();

  result = MallocNew(struct SRC_Instance_Record);
  result->stats = SST_CreateInstance(ref_id, addr, min_samples, max_samples);

  if (n_sources == max_n_sources) {
    /* Reallocate memory */
    max_n_sources = max_n_sources > 0 ? 2 * max_n_sources : 4;
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
  result->type = type;
  result->sel_options = sel_options;

  SRC_SetRefid(result, ref_id, addr);
  SRC_ResetInstance(result);

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

  SST_DeleteInstance(instance->stats);
  dead_index = instance->index;
  for (i=dead_index; i<n_sources-1; i++) {
    sources[i] = sources[i+1];
    sources[i]->index = i;
  }
  --n_sources;
  Free(instance);

  /* If this was the previous reference source, we have to reselect! */
  if (selected_source_index == dead_index)
    SRC_ReselectSource();
  else if (selected_source_index > dead_index)
    --selected_source_index;
}

/* ================================================== */

void
SRC_ResetInstance(SRC_Instance instance)
{
  instance->leap_status = LEAP_Normal;
  instance->active = 0;
  instance->updates = 0;
  instance->reachability = 0;
  instance->reachability_size = 0;
  instance->distant = 0;
  instance->status = SRC_BAD_STATS;
  instance->sel_score = 1.0;

  SST_ResetInstance(instance->stats);
}

/* ================================================== */

void
SRC_SetRefid(SRC_Instance instance, uint32_t ref_id, IPAddr *addr)
{
  instance->ref_id = ref_id;
  instance->ip_addr = addr;
  SST_SetRefid(instance->stats, ref_id, addr);
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

  DEBUG_LOG(LOGF_Sources, "ip=[%s] t=%s ofs=%f del=%f disp=%f str=%d",
      source_to_string(inst), UTI_TimevalToString(sample_time), -offset, root_delay, root_dispersion, stratum);

  if (REF_IsLeapSecondClose()) {
    LOG(LOGS_INFO, LOGF_Sources, "Dropping sample around leap second");
    return;
  }

  /* WE HAVE TO NEGATE OFFSET IN THIS CALL, IT IS HERE THAT THE SENSE OF OFFSET
     IS FLIPPED */
  SST_AccumulateSample(inst->stats, sample_time, -offset, peer_delay, peer_dispersion, root_delay, root_dispersion, stratum);
  SST_DoNewRegression(inst->stats);
}

/* ================================================== */

void
SRC_SetActive(SRC_Instance inst)
{
  inst->active = 1;
}

/* ================================================== */

void
SRC_UnsetActive(SRC_Instance inst)
{
  inst->active = 0;
}

/* ================================================== */

static int
special_mode_end(void)
{
    int i;

    for (i = 0; i < n_sources; i++) {
      /* No updates from inactive sources */
      if (!sources[i]->active)
        continue;

      /* Don't expect more updates than from an offline iburst NTP source */
      if (sources[i]->reachability_size >= SOURCE_REACH_BITS - 1)
        continue;

      /* Check if the source could still have enough samples to be selectable */
      if (SOURCE_REACH_BITS - 1 - sources[i]->reachability_size +
            SRC_Samples(sources[i]) >= MIN_SAMPLES_FOR_REGRESS)
        return 0;
    }

    return 1;
}

void
SRC_UpdateReachability(SRC_Instance inst, int reachable)
{
  inst->reachability <<= 1;
  inst->reachability |= !!reachable;
  inst->reachability %= 1U << SOURCE_REACH_BITS;

  if (inst->reachability_size < SOURCE_REACH_BITS)
      inst->reachability_size++;

  if (!reachable && inst->index == selected_source_index) {
    /* Try to select a better source */
    SRC_SelectSource(NULL);
  }

  /* Check if special reference update mode failed */
  if (REF_GetMode() != REF_ModeNormal && special_mode_end()) {
    REF_SetUnsynchronised();
  }

  /* Try to replace NTP sources that are unreachable, falsetickers, or
     have root distance larger than the allowed maximum */
  if (inst->type == SRC_NTP &&
      ((!inst->reachability && inst->reachability_size == SOURCE_REACH_BITS) ||
       inst->status == SRC_FALSETICKER || inst->status == SRC_BAD_DISTANCE)) {
    NSR_HandleBadSource(inst->ip_addr);
  }
}

/* ================================================== */

void
SRC_ResetReachability(SRC_Instance inst)
{
  inst->reachability = 0;
  inst->reachability_size = 0;
  SRC_UpdateReachability(inst, 0);
}

/* ================================================== */

static void
log_selection_message(char *format, char *arg)
{
  if (REF_GetMode() != REF_ModeNormal)
    return;
  LOG(LOGS_INFO, LOGF_Sources, format, arg);
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

static void
mark_ok_sources(SRC_Status status)
{
  int i;

  for (i = 0; i < n_sources; i++) {
    if (sources[i]->status != SRC_OK)
      continue;
    sources[i]->status = status;
  }
}

/* ================================================== */

static int
combine_sources(int n_sel_sources, struct timeval *ref_time, double *offset,
                double *offset_sd, double *frequency, double *skew)
{
  struct timeval src_ref_time;
  double src_offset, src_offset_sd, src_frequency, src_skew;
  double src_root_delay, src_root_dispersion, sel_src_distance, elapsed;
  double offset_weight, sum_offset_weight, sum_offset, sum2_offset_sd;
  double frequency_weight, sum_frequency_weight, sum_frequency, inv_sum2_skew;
  int i, index, combined;

  if (n_sel_sources == 1)
    return 1;

  sum_offset_weight = sum_offset = sum2_offset_sd = 0.0;
  sum_frequency_weight = sum_frequency = inv_sum2_skew = 0.0;

  sel_src_distance = sources[selected_source_index]->sel_info.root_distance;
  if (sources[selected_source_index]->type == SRC_NTP)
    sel_src_distance += reselect_distance;

  for (i = combined = 0; i < n_sel_sources; i++) {
    index = sel_sources[i];
    SST_GetTrackingData(sources[index]->stats, &src_ref_time,
                        &src_offset, &src_offset_sd,
                        &src_frequency, &src_skew,
                        &src_root_delay, &src_root_dispersion);

    /* Don't include this source if its distance is longer than the distance of
       the selected source multiplied by the limit, their estimated frequencies
       are not close, or it was recently marked as distant */

    if (index != selected_source_index &&
        (sources[index]->sel_info.root_distance > combine_limit * sel_src_distance ||
         fabs(*frequency - src_frequency) >
           combine_limit * (*skew + src_skew + LCL_GetMaxClockError()))) {
      /* Use a smaller penalty in first few updates */
      sources[index]->distant = sources[index]->reachability_size >= SOURCE_REACH_BITS ?
                                DISTANT_PENALTY : 1;
    } else if (sources[index]->distant) {
      sources[index]->distant--;
    }

    if (sources[index]->distant) {
      sources[index]->status = SRC_DISTANT;
      continue;
    }

    if (sources[index]->status == SRC_OK)
      sources[index]->status = SRC_UNSELECTED;

    UTI_DiffTimevalsToDouble(&elapsed, ref_time, &src_ref_time);
    src_offset += elapsed * src_frequency;
    offset_weight = 1.0 / sources[index]->sel_info.root_distance;
    frequency_weight = 1.0 / src_skew;

    DEBUG_LOG(LOGF_Sources, "combining index=%d oweight=%e offset=%e sd=%e fweight=%e freq=%e skew=%e",
        index, offset_weight, src_offset, src_offset_sd, frequency_weight, src_frequency, src_skew);

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

  DEBUG_LOG(LOGF_Sources, "combined result offset=%e sd=%e freq=%e skew=%e",
      *offset, *offset_sd, *frequency, *skew);

  return combined;
}

/* ================================================== */
/* This function selects the current reference from amongst the pool
   of sources we are holding and updates the local reference */

void
SRC_SelectSource(SRC_Instance updated_inst)
{
  struct SelectInfo *si;
  struct timeval now, ref_time;
  int i, j, j1, j2, index, sel_prefer, n_endpoints, n_sel_sources;
  int n_badstats_sources, max_sel_reach, max_badstat_reach, sel_req_source;
  int depth, best_depth, trust_depth, best_trust_depth;
  int combined, stratum, min_stratum, max_score_index;
  int orphan_stratum, orphan_source;
  double src_offset, src_offset_sd, src_frequency, src_skew;
  double src_root_delay, src_root_dispersion;
  double best_lo, best_hi, distance, sel_src_distance, max_score;
  double first_sample_ago, max_reach_sample_ago;
  NTP_Leap leap_status;

  if (updated_inst)
    updated_inst->updates++;

  if (n_sources == 0) {
    /* In this case, we clearly cannot synchronise to anything */
    if (selected_source_index != INVALID_SOURCE) {
      log_selection_message("Can't synchronise: no sources", NULL);
      selected_source_index = INVALID_SOURCE;
    }
    return;
  }

  /* This is accurate enough and cheaper than calling LCL_ReadCookedTime */
  SCH_GetLastEventTime(&now, NULL, NULL);

  /* Step 1 - build intervals about each source */

  n_endpoints = 0;
  n_sel_sources = 0;
  n_badstats_sources = 0;
  sel_req_source = 0;
  max_sel_reach = max_badstat_reach = 0;
  max_reach_sample_ago = 0.0;

  for (i = 0; i < n_sources; i++) {
    assert(sources[i]->status != SRC_OK);

    /* If some sources are specified with the require option, at least one
       of them will have to be selectable in order to update the clock */
    if (sources[i]->sel_options & SRC_SELECT_REQUIRE)
      sel_req_source = 1;

    /* Ignore sources which were added with the noselect option */
    if (sources[i]->sel_options & SRC_SELECT_NOSELECT) {
      sources[i]->status = SRC_UNSELECTABLE;
      continue;
    }

    si = &sources[i]->sel_info;
    SST_GetSelectionData(sources[i]->stats, &now, &si->stratum,
                         &si->lo_limit, &si->hi_limit, &si->root_distance,
                         &si->variance, &first_sample_ago,
                         &si->last_sample_ago, &si->select_ok);

    if (!si->select_ok) {
      ++n_badstats_sources;
      sources[i]->status = SRC_BAD_STATS;
      if (max_badstat_reach < sources[i]->reachability)
        max_badstat_reach = sources[i]->reachability;
      continue;
    }

    /* Require the root distance to be below the allowed maximum */
    if (si->root_distance > max_distance) {
      sources[i]->status = SRC_BAD_DISTANCE;
      continue;
    }

    sources[i]->status = SRC_OK; /* For now */

    if (sources[i]->reachability && max_reach_sample_ago < first_sample_ago)
      max_reach_sample_ago = first_sample_ago;

    if (max_sel_reach < sources[i]->reachability)
      max_sel_reach = sources[i]->reachability;
  }

  orphan_stratum = REF_GetOrphanStratum();
  orphan_source = INVALID_SOURCE;

  for (i = 0; i < n_sources; i++) {
    if (sources[i]->status != SRC_OK)
      continue;

    si = &sources[i]->sel_info;

    /* Reachability is not a requirement for selection.  An unreachable source
       can still be selected if its newest sample is not older than the oldest
       sample from reachable sources. */
    if (!sources[i]->reachability && max_reach_sample_ago < si->last_sample_ago) {
      sources[i]->status = SRC_STALE;
      continue;
    }

    /* When the local reference is configured with the orphan option, NTP
       sources that have stratum equal to the configured local stratum are
       considered to be orphans (i.e. serving local time while not being
       synchronised with real time) and are excluded from the normal source
       selection.  Sources with stratum larger than the local stratum are
       considered to be directly on indirectly synchronised to an orphan and
       are always ignored.

       If no selectable source is available and all orphan sources have
       reference IDs larger than the local ID, no source will be selected and
       the local reference mode will be activated at some point, i.e. this host
       will become an orphan.  Otherwise, the orphan source with the smallest
       reference ID will be selected.  This ensures a group of servers polling
       each other (with the same orphan configuration) which have no external
       source can settle down to a state where only one server is serving its
       local unsychronised time and others are synchronised to it. */

    if (si->stratum >= orphan_stratum && sources[i]->type == SRC_NTP) {
      sources[i]->status = SRC_ORPHAN;

      if (si->stratum == orphan_stratum && sources[i]->reachability &&
          (orphan_source == INVALID_SOURCE ||
           sources[i]->ref_id < sources[orphan_source]->ref_id))
        orphan_source = i;

      continue;
    }

    ++n_sel_sources;
  }

  /* If no selectable source is available, consider the orphan source */
  if (!n_sel_sources && orphan_source != INVALID_SOURCE) {
    uint32_t local_ref_id = NSR_GetLocalRefid(sources[orphan_source]->ip_addr);

    if (!local_ref_id) {
      LOG(LOGS_ERR, LOGF_Sources, "Unknown local refid in orphan mode");
    } else if (sources[orphan_source]->ref_id < local_ref_id) {
      sources[orphan_source]->status = SRC_OK;
      n_sel_sources = 1;
      DEBUG_LOG(LOGF_Sources, "selecting orphan refid=%"PRIx32,
                sources[orphan_source]->ref_id);
    }
  }

  for (i = 0; i < n_sources; i++) {
    if (sources[i]->status != SRC_OK)
      continue;

    si = &sources[i]->sel_info;

    j1 = n_endpoints;
    j2 = j1 + 1;

    sort_list[j1].index = i;
    sort_list[j1].offset = si->lo_limit;
    sort_list[j1].tag = LOW;

    sort_list[j2].index = i;
    sort_list[j2].offset = si->hi_limit;
    sort_list[j2].tag = HIGH;

    n_endpoints += 2;
  }

  DEBUG_LOG(LOGF_Sources, "badstat=%d sel=%d badstat_reach=%x sel_reach=%x max_reach_ago=%f",
            n_badstats_sources, n_sel_sources, max_badstat_reach,
            max_sel_reach, max_reach_sample_ago);

  /* Wait for the next call if we have no source selected and there is
     a source with bad stats (has less than 3 samples) with reachability
     equal to shifted maximum reachability of sources with valid stats.
     This delays selecting source on start with servers using the same
     polling interval until they all have valid stats. */
  if (n_badstats_sources && n_sel_sources &&
      selected_source_index == INVALID_SOURCE &&
      max_sel_reach >> 1 == max_badstat_reach) {
    mark_ok_sources(SRC_WAITS_STATS);
    return;
  }

  if (n_endpoints == 0) {
    /* No sources provided valid endpoints */
    if (selected_source_index != INVALID_SOURCE) {
      log_selection_message("Can't synchronise: no selectable sources", NULL);
      selected_source_index = INVALID_SOURCE;
    }
    return;
  }

  /* Now sort the endpoint list */
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

     Intervals from sources specified with the trust option have higher
     priority in the search.
     */

  trust_depth = best_trust_depth = 0;
  depth = best_depth = 0;
  best_lo = best_hi = 0.0;

  for (i = 0; i < n_endpoints; i++) {
    switch (sort_list[i].tag) {
      case LOW:
        depth++;
        if (sources[sort_list[i].index]->sel_options & SRC_SELECT_TRUST)
          trust_depth++;
        if (trust_depth > best_trust_depth ||
            (trust_depth == best_trust_depth && depth > best_depth)) {
          best_trust_depth = trust_depth;
          best_depth = depth;
          best_lo = sort_list[i].offset;
        }
        break;
      case HIGH:
        if (trust_depth == best_trust_depth && depth == best_depth)
          best_hi = sort_list[i].offset;
        if (sources[sort_list[i].index]->sel_options & SRC_SELECT_TRUST)
          trust_depth--;
        depth--;
        break;
      default:
        assert(0);
    }
  }

  if (best_depth <= n_sel_sources / 2 && !best_trust_depth) {
    /* Could not even get half the reachable sources to agree and there
       are no trusted sources - clearly we can't synchronise */

    if (selected_source_index != INVALID_SOURCE) {
      log_selection_message("Can't synchronise: no majority", NULL);
      REF_SetUnsynchronised();
      selected_source_index = INVALID_SOURCE;
    }

    /* .. and mark all sources as falsetickers (so they appear thus
       on the outputs from the command client) */
    mark_ok_sources(SRC_FALSETICKER);

    return;
  }

  /* We have our interval, now work out which source are in it,
     i.e. build list of admissible sources. */

  n_sel_sources = 0;

  for (i = 0; i < n_sources; i++) {
    /* This should be the same condition to get into the endpoint
       list */
    if (sources[i]->status != SRC_OK)
      continue;

    /* Check if source's interval contains the best interval, or is wholly
       contained within it.  If there are any trusted sources the first
       condition is applied only to them to not allow non-trusted sources to
       move the final offset outside the interval. */
    if (((!best_trust_depth || sources[i]->sel_options & SRC_SELECT_TRUST) &&
         sources[i]->sel_info.lo_limit <= best_lo &&
         sources[i]->sel_info.hi_limit >= best_hi) ||
        (sources[i]->sel_info.lo_limit >= best_lo &&
         sources[i]->sel_info.hi_limit <= best_hi)) {

      sel_sources[n_sel_sources++] = i;

      if (sources[i]->sel_options & SRC_SELECT_REQUIRE)
        sel_req_source = 0;
    } else {
      sources[i]->status = SRC_FALSETICKER;
    }
  }

  if (!n_sel_sources || sel_req_source || n_sel_sources < CNF_GetMinSources()) {
    if (selected_source_index != INVALID_SOURCE) {
      log_selection_message("Can't synchronise: %s selectable sources",
                            !n_sel_sources ? "no" :
                            sel_req_source ? "no required source in" : "not enough");
      selected_source_index = INVALID_SOURCE;
    }
    mark_ok_sources(SRC_WAITS_SOURCES);
    return;
  }

  /* Accept leap second status if more than half of selectable sources agree */
  for (i = j1 = j2 = 0; i < n_sel_sources; i++) {
    index = sel_sources[i];
    if (sources[index]->leap_status == LEAP_InsertSecond)
      j1++;
    else if (sources[index]->leap_status == LEAP_DeleteSecond)
      j2++;
  }

  if (j1 > n_sel_sources / 2)
    leap_status = LEAP_InsertSecond;
  else if (j2 > n_sel_sources / 2)
    leap_status = LEAP_DeleteSecond;
  else
    leap_status = LEAP_Normal;

  /* If there are any sources with prefer option, reduce the list again
     only to the preferred sources */
  for (i = 0; i < n_sel_sources; i++) {
    if (sources[sel_sources[i]]->sel_options & SRC_SELECT_PREFER)
      break;
  }
  if (i < n_sel_sources) {
    for (i = j = 0; i < n_sel_sources; i++) {
      if (!(sources[sel_sources[i]]->sel_options & SRC_SELECT_PREFER))
        sources[sel_sources[i]]->status = SRC_NONPREFERRED;
      else
        sel_sources[j++] = sel_sources[i];
    }
    assert(j > 0);
    n_sel_sources = j;
    sel_prefer = 1;
  } else {
    sel_prefer = 0;
  }

  /* Find minimum stratum */

  index = sel_sources[0];
  min_stratum = sources[index]->sel_info.stratum;
  for (i = 1; i < n_sel_sources; i++) {
    index = sel_sources[i];
    stratum = sources[index]->sel_info.stratum;
    if (stratum < min_stratum)
      min_stratum = stratum;
  }

  /* Update scores and find the source with maximum score */

  max_score_index = INVALID_SOURCE;
  max_score = 0.0;
  sel_src_distance = 0.0;

  if (selected_source_index != INVALID_SOURCE)
    sel_src_distance = sources[selected_source_index]->sel_info.root_distance +
      (sources[selected_source_index]->sel_info.stratum - min_stratum) * stratum_weight;

  for (i = 0; i < n_sources; i++) {
    /* Reset score for non-selectable sources */
    if (sources[i]->status != SRC_OK ||
        (sel_prefer && !(sources[i]->sel_options & SRC_SELECT_PREFER))) {
      sources[i]->sel_score = 1.0;
      sources[i]->distant = DISTANT_PENALTY;
      continue;
    }

    distance = sources[i]->sel_info.root_distance +
      (sources[i]->sel_info.stratum - min_stratum) * stratum_weight;
    if (sources[i]->type == SRC_NTP)
      distance += reselect_distance;

    if (selected_source_index != INVALID_SOURCE) {
      /* Update score, but only for source pairs where one source
         has a new sample */
      if (sources[i] == updated_inst ||
          sources[selected_source_index] == updated_inst) {

        sources[i]->sel_score *= sel_src_distance / distance;

        if (sources[i]->sel_score < 1.0)
          sources[i]->sel_score = 1.0;
      }
    } else {
      /* When there is no selected source yet, assign scores so that the
         source with minimum distance will have maximum score.  The scores
         will be reset when the source is selected later in this function. */
      sources[i]->sel_score = 1.0 / distance;
    }

    DEBUG_LOG(LOGF_Sources, "select score=%f refid=%"PRIx32" match_refid=%"PRIx32" status=%d dist=%f",
              sources[i]->sel_score, sources[i]->ref_id,
              updated_inst ? updated_inst->ref_id : 0,
              sources[i]->status, distance);

    if (max_score < sources[i]->sel_score) {
      max_score = sources[i]->sel_score;
      max_score_index = i;
    }
  }

  assert(max_score_index != INVALID_SOURCE);

  /* Is the current source still a survivor and no other source has reached
     the score limit? */
  if (selected_source_index == INVALID_SOURCE ||
      sources[selected_source_index]->status != SRC_OK ||
      (max_score_index != selected_source_index && max_score > SCORE_LIMIT)) {

    /* Before selecting the new synchronisation source wait until the reference
       can be updated */
    if (sources[max_score_index]->updates == 0) {
      selected_source_index = INVALID_SOURCE;
      mark_ok_sources(SRC_WAITS_UPDATE);
      DEBUG_LOG(LOGF_Sources, "best source has no updates");
      return;
    }

    selected_source_index = max_score_index;
    log_selection_message("Selected source %s",
                          source_to_string(sources[selected_source_index]));

    /* New source has been selected, reset all scores */
    for (i = 0; i < n_sources; i++) {
      sources[i]->sel_score = 1.0;
      sources[i]->distant = 0;
    }
  }

  sources[selected_source_index]->status = SRC_SELECTED;

  /* Don't update reference when the selected source has no new samples */

  if (sources[selected_source_index]->updates == 0) {
    /* Mark the remaining sources as last combine_sources() call */

    for (i = 0; i < n_sel_sources; i++) {
      index = sel_sources[i];
      if (sources[index]->status == SRC_OK)
        sources[index]->status = sources[index]->distant ?
                                 SRC_DISTANT : SRC_UNSELECTED;
    }
    return;
  }

  for (i = 0; i < n_sources; i++)
    sources[i]->updates = 0;

  /* Now just use the statistics of the selected source combined with
     the other selectable sources for trimming the local clock */

  SST_GetTrackingData(sources[selected_source_index]->stats, &ref_time,
                      &src_offset, &src_offset_sd,
                      &src_frequency, &src_skew,
                      &src_root_delay, &src_root_dispersion);

  combined = combine_sources(n_sel_sources, &ref_time, &src_offset,
                             &src_offset_sd, &src_frequency, &src_skew);

  REF_SetReference(sources[selected_source_index]->sel_info.stratum,
                   leap_status, combined,
                   sources[selected_source_index]->ref_id,
                   sources[selected_source_index]->ip_addr,
                   &ref_time, src_offset, src_offset_sd,
                   src_frequency, src_skew,
                   src_root_delay, src_root_dispersion);
}

/* ================================================== */
/* Force reselecting the best source */

void
SRC_ReselectSource(void)
{
  selected_source_index = INVALID_SOURCE;
  SRC_SelectSource(NULL);
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
             LCL_ChangeType change_type,
             void *anything)
{
  int i;

  for (i=0; i<n_sources; i++) {
    if (change_type == LCL_ChangeUnknownStep) {
      SST_ResetInstance(sources[i]->stats);
    } else {
      SST_SlewSamples(sources[i]->stats, cooked, dfreq, doffset);
    }
  }

  if (change_type == LCL_ChangeUnknownStep) {
    /* After resetting no source is selectable, set reference unsynchronised */
    SRC_SelectSource(NULL);
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

  for (i = 0; i < n_sources; i++) {
    a = (sources[i]->ref_id) >> 24;
    b = ((sources[i]->ref_id) >> 16) & 0xff;
    c = ((sources[i]->ref_id) >> 8) & 0xff;
    d = ((sources[i]->ref_id)) & 0xff;

    snprintf(filename, file_len - 1, "%s/%d.%d.%d.%d.dat", direc, a, b, c, d);
    out = fopen(filename, "w");
    if (!out) {
      LOG(LOGS_WARN, LOGF_Sources, "Could not open dump file %s", filename);
    } else {
      SST_SaveToFile(sources[i]->stats, out);
      fclose(out);
    }
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
SRC_IsReachable(SRC_Instance inst)
{
  return inst->reachability != 0;
}

/* ================================================== */

int
SRC_ReadNumberOfSources(void)
{
  return n_sources;
}

/* ================================================== */

int
SRC_ActiveSources(void)
{
  int i, r;

  for (i = r = 0; i < n_sources; i++)
    if (sources[i]->active)
      r++;

  return r;
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
      case SRC_UNSELECTABLE:
      case SRC_BAD_STATS:
      case SRC_BAD_DISTANCE:
      case SRC_STALE:
      case SRC_ORPHAN:
      case SRC_WAITS_STATS:
        report->state = RPT_UNREACH;
        break;
      case SRC_FALSETICKER:
        report->state = RPT_FALSETICKER;
        break;
      case SRC_JITTERY:
        report->state = RPT_JITTERY;
        break;
      case SRC_WAITS_SOURCES:
      case SRC_NONPREFERRED:
      case SRC_WAITS_UPDATE:
      case SRC_DISTANT:
      case SRC_OUTLIER:
        report->state = RPT_OUTLIER;
        break;
      case SRC_UNSELECTED:
        report->state = RPT_CANDIDATE;
        break;
      case SRC_SELECTED:
        report->state = RPT_SYNC;
        break;
      case SRC_OK:
      default:
        assert(0);
        break;
    }

    report->sel_options = src->sel_options;
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

int
SRC_Samples(SRC_Instance inst)
{
  return SST_Samples(inst->stats);
}

/* ================================================== */
