/*
  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2003
 * Copyright (C) Miroslav Lichvar  2009-2014
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

  Core NTP protocol engine
  */

#include "config.h"

#include "sysincl.h"

#include "ntp_core.h"
#include "ntp_io.h"
#include "memory.h"
#include "sched.h"
#include "reference.h"
#include "local.h"
#include "sources.h"
#include "util.h"
#include "conf.h"
#include "logging.h"
#include "keys.h"
#include "addrfilt.h"
#include "clientlog.h"

/* ================================================== */

static LOG_FileID logfileid;

/* ================================================== */
/* Enumeration used for remembering the operating mode of one of the
   sources */

typedef enum {
  MD_OFFLINE,                   /* No sampling at all */
  MD_ONLINE,                    /* Normal sampling based on sampling interval */
  MD_BURST_WAS_OFFLINE,         /* Burst sampling, return to offline afterwards */
  MD_BURST_WAS_ONLINE,          /* Burst sampling, return to online afterwards */
} OperatingMode;

/* ================================================== */
/* Structure used for holding a single peer/server's
   protocol machine */

struct NCR_Instance_Record {
  NTP_Remote_Address remote_addr; /* Needed for routing transmit packets */
  NTP_Local_Address local_addr; /* Local address/socket used to send packets */
  NTP_Mode mode;                /* The source's NTP mode
                                   (client/server or symmetric active peer) */
  OperatingMode opmode;         /* Whether we are sampling this source
                                   or not and in what way */
  int timer_running;            /* Boolean indicating whether we have a timeout
                                   pending to transmit to the source */
  SCH_TimeoutID timeout_id;     /* Scheduler's timeout ID, if we are
                                   running on a timer. */
  int tx_suspended;             /* Boolean indicating we can't transmit yet */

  int auto_offline;             /* If 1, automatically go offline if server/peer
                                   isn't responding */

  int local_poll;               /* Log2 of polling interval at our end */
  int remote_poll;              /* Log2 of server/peer's polling interval (recovered
                                   from received packets) */
  int remote_stratum;           /* Stratum of the server/peer (recovered from
                                   received packets) */

  int presend_minpoll;           /* If the current polling interval is
                                    at least this, an echo datagram
                                    will be send some time before every
                                    transmit.  This ensures that both
                                    us and the server/peer have an ARP
                                    entry for each other ready, which
                                    means our measurement is not
                                    botched by an ARP round-trip on one
                                    side or the other. */

  int presend_done;             /* The presend packet has been sent */

  int minpoll;                  /* Log2 of minimum defined polling interval */
  int maxpoll;                  /* Log2 of maximum defined polling interval */

  int min_stratum;              /* Increase stratum in received packets to the
                                   minimum */

  int poll_target;              /* Target number of sourcestats samples */

  double poll_score;            /* Score of current local poll */

  double max_delay;             /* Maximum round-trip delay to the
                                   peer that we can tolerate and still
                                   use the sample for generating
                                   statistics from */

  double max_delay_ratio;       /* Largest ratio of delta /
                                   min_delay_in_register that we can
                                   tolerate.  */

  double max_delay_dev_ratio;   /* Maximum ratio of increase in delay / stddev */

  int do_auth;                  /* Flag indicating whether we
                                   authenticate packets we send to
                                   this machine (if it's serving us or
                                   the association is symmetric). Note
                                   : we don't authenticate if we can't
                                   find the key in our database. */
  unsigned long auth_key_id;    /* The ID of the authentication key to
                                   use. */

  /* Count of how many packets we have transmitted since last successful
     receive from this peer */
  int tx_count;

  /* Timestamp in tx field of last received packet.  We have to
     reproduce this exactly as the orig field or our outgoing
     packet. */
  NTP_int64 remote_orig;     

  /* Local timestamp when the last packet was received from the
     source.  We have to be prepared to tinker with this if the local
     clock has its frequency adjusted before we repond.  The value we
     store here is what our own local time was when the same arrived.
     Before replying, we have to correct this to fit with the
     parameters for the current reference.  (It must be stored
     relative to local time to permit frequency and offset adjustments
     to be made when we trim the local clock). */
  struct timeval local_rx;

  /* Local timestamp when we last transmitted a packet to the source.
     We store two versions.  The first is in NTP format, and is used
     to validate the next received packet from the source.
     Additionally, this is corrected to bring it into line with the
     current reference.  The second is in timeval format, and is kept
     relative to the local clock.  We modify this in accordance with
     local clock frequency/offset changes, and use this for computing
     statistics about the source when a return packet arrives. */
  NTP_int64 local_ntp_tx;
  struct timeval local_tx;

  /* The instance record in the main source management module.  This
     performs the statistical analysis on the samples we generate */

  SRC_Instance source;

  int burst_good_samples_to_go;
  int burst_total_samples_to_go;

};

/* ================================================== */
/* Initial delay period before first packet is transmitted (in seconds) */
#define INITIAL_DELAY 0.2

/* Spacing required between samples for any two servers/peers (to
   minimise risk of network collisions) (in seconds) */
#define SAMPLING_SEPARATION 0.2

/* Randomness added to spacing between samples for one server/peer */
#define SAMPLING_RANDOMNESS 0.02

/* Adjustment of the peer polling interval */
#define PEER_SAMPLING_ADJ 1.1

/* Spacing between samples in burst mode for one server/peer */
#define BURST_INTERVAL 2.0

/* Time to wait before retransmitting in burst mode, if we did not get
   a reply to the previous probe */
#define BURST_TIMEOUT 2.0

/* Number of samples in initial burst */
#define IBURST_GOOD_SAMPLES 4
#define IBURST_TOTAL_SAMPLES SOURCE_REACH_BITS

/* Time to wait after sending echo to 'warm up' link */
#define WARM_UP_DELAY 4.0

/* The NTP protocol version that we support */
#define NTP_VERSION 3

/* Compatible NTP protocol versions */
#define NTP_MAX_COMPAT_VERSION 4
#define NTP_MIN_COMPAT_VERSION 1

/* Maximum allowed dispersion - as defined in RFC1305 (16 seconds) */
#define NTP_MAX_DISPERSION 16.0

/* Maximum allowed age of a reference to be supplied to a client (1 day) */
#define NTP_MAXAGE 86400

/* Maximum allowed stratum */
#define NTP_MAX_STRATUM 15

/* INVALID or Unkown  stratum from external server  as per the NTP 4 docs */
#define NTP_INVALID_STRATUM 0

/* Minimum allowed poll interval */
#define MIN_POLL 0

/* Maximum poll interval set by KoD RATE */
#define MAX_KOD_RATE_POLL SRC_DEFAULT_MAXPOLL

#define INVALID_SOCK_FD -1

/* ================================================== */

static ADF_AuthTable access_auth_table;

/* ================================================== */
/* Forward prototypes */

static void transmit_timeout(void *arg);

/* ================================================== */

void
NCR_Initialise(void)
{
  logfileid = CNF_GetLogMeasurements() ? LOG_FileOpen("measurements",
      "   Date (UTC) Time     IP Address   L St 1234 abc 5678 LP RP Score Offset     Peer del. Peer disp. Root del.  Root disp.")
    : -1;

  access_auth_table = ADF_CreateTable();
}

/* ================================================== */

void
NCR_Finalise(void)
{
  ADF_DestroyTable(access_auth_table);

}

/* ================================================== */

static void
start_initial_timeout(NCR_Instance inst)
{
  /* Check if we can transmit */
  if (inst->tx_suspended) {
    assert(!inst->timer_running);
    return;
  }

  /* Stop old timer if running */
  if (inst->timer_running)
    SCH_RemoveTimeout(inst->timeout_id);

  /* Start new timer for transmission */
  inst->timeout_id = SCH_AddTimeoutInClass(INITIAL_DELAY, SAMPLING_SEPARATION,
                                           SAMPLING_RANDOMNESS,
                                           SCH_NtpSamplingClass,
                                           transmit_timeout, (void *)inst);

  if (!inst->timer_running) {
    /* This will be the first transmission after mode change */

    inst->timer_running = 1;

    /* Mark source active */
    SRC_SetActive(inst->source);

    /* Open client socket */
    if (inst->mode == MODE_CLIENT) {
      assert(inst->local_addr.sock_fd == INVALID_SOCK_FD);
      inst->local_addr.sock_fd = NIO_GetClientSocket(&inst->remote_addr);
    }
  }
}

/* ================================================== */

static void
take_offline(NCR_Instance inst)
{
  inst->opmode = MD_OFFLINE;
  if (inst->timer_running) {
    SCH_RemoveTimeout(inst->timeout_id);
    inst->timer_running = 0;
  }

  /* Mark source unreachable */
  SRC_ResetReachability(inst->source);

  /* And inactive */
  SRC_UnsetActive(inst->source);

  /* Close client socket */
  if (inst->mode == MODE_CLIENT && inst->local_addr.sock_fd != INVALID_SOCK_FD) {
    NIO_CloseClientSocket(inst->local_addr.sock_fd);
    inst->local_addr.sock_fd = INVALID_SOCK_FD;
  }

  NCR_ResetInstance(inst);
}

/* ================================================== */

NCR_Instance
NCR_GetInstance(NTP_Remote_Address *remote_addr, NTP_Source_Type type, SourceParameters *params)
{
  NCR_Instance result;

  result = MallocNew(struct NCR_Instance_Record);

  result->remote_addr = *remote_addr;
  result->local_addr.ip_addr.family = IPADDR_UNSPEC;

  switch (type) {
    case NTP_SERVER:
      /* Client socket will be obtained when timer is started */
      result->local_addr.sock_fd = INVALID_SOCK_FD;
      result->mode = MODE_CLIENT;
      break;
    case NTP_PEER:
      result->local_addr.sock_fd = NIO_GetServerSocket(remote_addr);
      result->mode = MODE_ACTIVE;
      break;
    default:
      assert(0);
  }

  result->minpoll = params->minpoll;
  if (result->minpoll < MIN_POLL)
    result->minpoll = SRC_DEFAULT_MINPOLL;
  result->maxpoll = params->maxpoll;
  if (result->maxpoll < MIN_POLL)
    result->maxpoll = SRC_DEFAULT_MAXPOLL;
  if (result->maxpoll < result->minpoll)
    result->maxpoll = result->minpoll;

  result->min_stratum = params->min_stratum;
  result->presend_minpoll = params->presend_minpoll;

  result->max_delay = params->max_delay;
  result->max_delay_ratio = params->max_delay_ratio;
  result->max_delay_dev_ratio = params->max_delay_dev_ratio;
  result->auto_offline = params->auto_offline;
  result->poll_target = params->poll_target;

  if (params->authkey == INACTIVE_AUTHKEY) {
    result->do_auth = 0;
    result->auth_key_id = 0UL;
  } else {
    result->do_auth = 1;
    result->auth_key_id = params->authkey;
    if (!KEY_KeyKnown(result->auth_key_id)) {
      LOG(LOGS_WARN, LOGF_NtpCore, "Source %s added with unknown key %lu",
          UTI_IPToString(&result->remote_addr.ip_addr), result->auth_key_id);
    }
  }

  /* Create a source instance for this NTP source */
  result->source = SRC_CreateNewInstance(UTI_IPToRefid(&remote_addr->ip_addr), SRC_NTP, params->sel_option, &result->remote_addr.ip_addr);

  result->timer_running = 0;
  result->timeout_id = 0;
  result->tx_suspended = 1;
  result->opmode = params->online ? MD_ONLINE : MD_OFFLINE;
  
  NCR_ResetInstance(result);

  if (params->iburst) {
    NCR_InitiateSampleBurst(result, IBURST_GOOD_SAMPLES, IBURST_TOTAL_SAMPLES);
  }

  return result;
}

/* ================================================== */

/* Destroy an instance */
void
NCR_DestroyInstance(NCR_Instance instance)
{
  if (instance->opmode != MD_OFFLINE)
    take_offline(instance);

  /* This will destroy the source instance inside the
     structure, which will cause reselection if this was the
     synchronising source etc. */
  SRC_DestroyInstance(instance->source);

  /* Free the data structure */
  Free(instance);
}

/* ================================================== */

void
NCR_StartInstance(NCR_Instance instance)
{
  instance->tx_suspended = 0;
  if (instance->opmode != MD_OFFLINE)
    start_initial_timeout(instance);
}

/* ================================================== */

void
NCR_ResetInstance(NCR_Instance instance)
{
  instance->tx_count = 0;
  instance->presend_done = 0;

  instance->local_poll = instance->minpoll;
  instance->poll_score = 0.0;
  instance->remote_poll = 0;
  instance->remote_stratum = 0;

  instance->remote_orig.hi = 0;
  instance->remote_orig.lo = 0;
  instance->local_rx.tv_sec = 0;
  instance->local_rx.tv_usec = 0;
  instance->local_tx.tv_sec = 0;
  instance->local_tx.tv_usec = 0;
  instance->local_ntp_tx.hi = 0;
  instance->local_ntp_tx.lo = 0;
}

/* ================================================== */

static int
check_packet_auth(NTP_Packet *pkt, unsigned long keyid, int auth_len)
{
  return KEY_CheckAuth(keyid, (void *)pkt, offsetof(NTP_Packet, auth_keyid), 
      (void *)&(pkt->auth_data), auth_len);
}

/* ================================================== */

static void
adjust_poll(NCR_Instance inst, double adj)
{
  inst->poll_score += adj;

  if (inst->poll_score >= 1.0) {
    inst->local_poll += (int)inst->poll_score;
    inst->poll_score -= (int)inst->poll_score;
  }

  if (inst->poll_score < 0.0) {
    inst->local_poll += (int)(inst->poll_score - 1.0);
    inst->poll_score -= (int)(inst->poll_score - 1.0);
  }
  
  /* Clamp polling interval to defined range */
  if (inst->local_poll < inst->minpoll) {
    inst->local_poll = inst->minpoll;
    inst->poll_score = 0;
  } else if (inst->local_poll > inst->maxpoll) {
    inst->local_poll = inst->maxpoll;
    inst->poll_score = 1.0;
  }
}

/* ================================================== */

static double
get_poll_adj(NCR_Instance inst, double error_in_estimate, double peer_distance)
{
  double poll_adj;

  if (error_in_estimate > peer_distance) {
    int shift = 0;
    unsigned long temp = (int)(error_in_estimate / peer_distance);
    do {
      shift++;
      temp>>=1;
    } while (temp);

    poll_adj = -shift - inst->poll_score + 0.5;

  } else {
    int samples = SRC_Samples(inst->source);

    /* Adjust polling interval so that the number of sourcestats samples
       remains close to the target value */
    poll_adj = ((double)samples / inst->poll_target - 1.0) / inst->poll_target;

    /* Make interval shortening quicker */
    if (samples < inst->poll_target) {
      poll_adj *= 2.0;
    }
  }

  return poll_adj;
}

/* ================================================== */

static double
get_transmit_delay(NCR_Instance inst, int on_tx, double last_tx)
{
  int poll_to_use, stratum_diff;
  double delay_time;

  /* If we're in burst mode, queue for immediate dispatch.

     If we're operating in client/server mode, queue the timeout for
     the poll interval hence.  The fact that a timeout has been queued
     in the transmit handler is immaterial - that is only done so that
     we at least send something, if no reply is heard.

     If we're in symmetric mode, we have to take account of the peer's
     wishes, otherwise his sampling regime will fall to pieces.  If
     we're in client/server mode, we don't care what poll interval the
     server responded with last time. */

  switch (inst->opmode) {
    case MD_OFFLINE:
      assert(0);
      break;
    case MD_ONLINE:
      /* Normal processing, depending on whether we're in
         client/server or symmetric mode */

      switch(inst->mode) {
        case MODE_CLIENT:
          /* Client/server association - aim at some randomised time
             approx the poll interval away */
          poll_to_use = inst->local_poll;

          delay_time = (double) (1UL<<poll_to_use);

          break;

        case MODE_ACTIVE:
          /* Symmetric active association - aim at some randomised time approx
             the poll interval away since the last transmit */

          /* Use shorter of the local and remote poll interval, but not shorter
             than the allowed minimum */
          poll_to_use = inst->local_poll;
          if (poll_to_use > inst->remote_poll)
            poll_to_use = inst->remote_poll;
          if (poll_to_use < inst->minpoll)
            poll_to_use = inst->minpoll;

          delay_time = (double) (1UL<<poll_to_use);

          /* If the remote stratum is higher than ours, try to lock on the
             peer's polling to minimize our response time by slightly extending
             our delay or waiting for the peer to catch up with us as the
             random part in the actual interval is reduced. If the remote
             stratum is equal to ours, try to interleave evenly with the peer. */
          stratum_diff = inst->remote_stratum - REF_GetOurStratum();
          if ((stratum_diff > 0 && last_tx * PEER_SAMPLING_ADJ < delay_time) ||
              (!on_tx && !stratum_diff &&
               last_tx / delay_time > PEER_SAMPLING_ADJ - 0.5))
            delay_time *= PEER_SAMPLING_ADJ;

          /* Substract the already spend time */
          if (last_tx > 0.0)
            delay_time -= last_tx;
          if (delay_time < 0.0)
            delay_time = 0.0;

          break;
        default:
          assert(0);
          break;
      }
      break;

    case MD_BURST_WAS_ONLINE:
    case MD_BURST_WAS_OFFLINE:
      /* Burst modes */
      delay_time = on_tx ? BURST_TIMEOUT : BURST_INTERVAL;
      break;
    default:
      assert(0);
      break;
  }

  return delay_time;
}

/* ================================================== */

static void
transmit_packet(NTP_Mode my_mode, /* The mode this machine wants to be */
                int my_poll, /* The log2 of the local poll interval */
                int version, /* The NTP version to be set in the packet */
                int do_auth, /* Boolean indicating whether to authenticate the packet or not */
                unsigned long key_id, /* The authentication key ID */
                NTP_int64 *orig_ts, /* Originate timestamp (from received packet) */
                struct timeval *local_rx, /* Local time request packet was received */
                struct timeval *local_tx, /* RESULT : Time this reply
                                             is sent as local time, or
                                             NULL if don't want to
                                             know */
                NTP_int64 *local_ntp_tx, /* RESULT : Time reply sent
                                            as NTP timestamp
                                            (including adjustment to
                                            reference), ignored if
                                            NULL */
                NTP_Remote_Address *where_to, /* Where to address the reponse to */
                NTP_Local_Address *from /* From what address to send it */
                )
{
  NTP_Packet message;
  int leap;
  struct timeval local_transmit;

  /* Parameters read from reference module */
  int are_we_synchronised, our_stratum;
  NTP_Leap leap_status;
  uint32_t our_ref_id, ts_fuzz;
  struct timeval our_ref_time;
  double our_root_delay, our_root_dispersion;

  /* Don't reply with version higher than ours */
  if (version > NTP_VERSION) {
    version = NTP_VERSION;
  }

  /* This is accurate enough and cheaper than calling LCL_ReadCookedTime.
     A more accurate time stamp will be taken later in this function. */
  SCH_GetLastEventTime(&local_transmit, NULL, NULL);

  REF_GetReferenceParams(&local_transmit,
                         &are_we_synchronised, &leap_status,
                         &our_stratum,
                         &our_ref_id, &our_ref_time,
                         &our_root_delay, &our_root_dispersion);

  if (are_we_synchronised) {
    leap = (int) leap_status;
  } else {
    leap = LEAP_Unsynchronised;
  }

  /* Generate transmit packet */
  message.lvm = ((leap << 6) &0xc0) | ((version << 3) & 0x38) | (my_mode & 0x07); 
  if (our_stratum <= NTP_MAX_STRATUM) {
    message.stratum = our_stratum;
  } else {
    /* (WGU) to handle NTP  "Invalid" stratum as per the NTP V4 documents. */
    message.stratum = NTP_INVALID_STRATUM;
  }
 
  message.poll = my_poll;
  message.precision = LCL_GetSysPrecisionAsLog();

  /* If we're sending a client mode packet and we aren't synchronized yet, 
     we might have to set up artificial values for some of these parameters */
  message.root_delay = UTI_DoubleToInt32(our_root_delay);
  message.root_dispersion = UTI_DoubleToInt32(our_root_dispersion);

  message.reference_id = htonl((NTP_int32) our_ref_id);

  /* Now fill in timestamps */
  UTI_TimevalToInt64(&our_ref_time, &message.reference_ts, 0);

  /* Originate - this comes from the last packet the source sent us */
  message.originate_ts = *orig_ts;

  /* Receive - this is when we received the last packet from the source.
     This timestamp will have been adjusted so that it will now look to
     the source like we have been running on our latest estimate of
     frequency all along */
  UTI_TimevalToInt64(local_rx, &message.receive_ts, 0);

  /* Prepare random bits which will be added to the transmit timestamp. */
  ts_fuzz = UTI_GetNTPTsFuzz(message.precision);

  /* Transmit - this our local time right now!  Also, we might need to
     store this for our own use later, next time we receive a message
     from the source we're sending to now. */
  LCL_ReadCookedTime(&local_transmit, NULL);

  /* Authenticate */
  if (do_auth) {
    int auth_len;
    /* Pre-compensate the transmit time by approx. how long it will
       take to generate the authentication data. */
    local_transmit.tv_usec += KEY_GetAuthDelay(key_id);
    UTI_NormaliseTimeval(&local_transmit);
    UTI_TimevalToInt64(&local_transmit, &message.transmit_ts, ts_fuzz);

    auth_len = KEY_GenerateAuth(key_id, (unsigned char *) &message,
        offsetof(NTP_Packet, auth_keyid),
        (unsigned char *)&message.auth_data, sizeof (message.auth_data));
    if (auth_len > 0) {
      message.auth_keyid = htonl(key_id);
      NIO_SendAuthenticatedPacket(&message, where_to, from,
          sizeof (message.auth_keyid) + auth_len);
    } else {
      DEBUG_LOG(LOGF_NtpCore,
                "Could not generate auth data with key %lu to send packet",
                key_id);
      return;
    }
  } else {
    UTI_TimevalToInt64(&local_transmit, &message.transmit_ts, ts_fuzz);
    NIO_SendNormalPacket(&message, where_to, from);
  }

  if (local_tx) {
    *local_tx = local_transmit;
  }

  if (local_ntp_tx) {
    *local_ntp_tx = message.transmit_ts;
  }

}

/* ================================================== */
/* Timeout handler for transmitting to a source. */

static void
transmit_timeout(void *arg)
{
  NCR_Instance inst = (NCR_Instance) arg;
  double timeout_delay;

  inst->timer_running = 0;

  switch (inst->opmode) {
    case MD_BURST_WAS_ONLINE:
      /* With online burst switch to online before last packet */
      if (inst->burst_total_samples_to_go <= 1)
        inst->opmode = MD_ONLINE;
    case MD_BURST_WAS_OFFLINE:
      if (inst->burst_total_samples_to_go <= 0)
        take_offline(inst);
      break;
    default:
      break;
  }

  if (inst->opmode == MD_OFFLINE) {
    return;
  }

  DEBUG_LOG(LOGF_NtpCore, "Transmit timeout for [%s:%d]",
      UTI_IPToString(&inst->remote_addr.ip_addr), inst->remote_addr.port);

  /* Check whether we need to 'warm up' the link to the other end by
     sending an echo exchange to ensure both ends' ARP caches are
     primed.  On loaded systems this might also help ensure that bits
     of the program are paged in properly before we start. */

  if ((inst->presend_minpoll > 0) &&
      (inst->presend_minpoll <= inst->local_poll) &&
      !inst->presend_done) {
    
    /* Send */
    NIO_SendEcho(&inst->remote_addr, &inst->local_addr);

    inst->presend_done = 1;

    /* Requeue timeout */
    inst->timer_running = 1;
    inst->timeout_id = SCH_AddTimeoutInClass(WARM_UP_DELAY, SAMPLING_SEPARATION,
                                             SAMPLING_RANDOMNESS,
                                             SCH_NtpSamplingClass,
                                             transmit_timeout, (void *)inst);

    return;
  }

  inst->presend_done = 0; /* Reset for next time */

  ++inst->tx_count;

  /* If the source loses connectivity, back off the sampling rate to reduce
     wasted sampling. If it's the source to which we are currently locked,
     back off slower. */

  if (inst->tx_count >= 2) {
    /* Implies we have missed at least one transmission */

    adjust_poll(inst, SRC_IsSyncPeer(inst->source) ? 0.1 : 0.25);

    SRC_UpdateReachability(inst->source, 0);

    if (inst->auto_offline && inst->tx_count >= 3) {
      NCR_TakeSourceOffline(inst);
    }
  }

  transmit_packet(inst->mode, inst->local_poll,
                  NTP_VERSION,
                  inst->do_auth, inst->auth_key_id,
                  &inst->remote_orig,
                  &inst->local_rx, &inst->local_tx, &inst->local_ntp_tx,
                  &inst->remote_addr,
                  &inst->local_addr);

  switch (inst->opmode) {
    case MD_BURST_WAS_ONLINE:
    case MD_BURST_WAS_OFFLINE:
      --inst->burst_total_samples_to_go;
      break;
    default:
      break;
  }

  /* Restart timer for this message */
  timeout_delay = get_transmit_delay(inst, 1, 0.0);
  inst->timer_running = 1;
  inst->timeout_id = SCH_AddTimeoutInClass(timeout_delay, SAMPLING_SEPARATION,
                                           SAMPLING_RANDOMNESS,
                                           SCH_NtpSamplingClass,
                                           transmit_timeout, (void *)inst);
}


/* ================================================== */

static void
receive_packet(NTP_Packet *message, struct timeval *now, double now_err, NCR_Instance inst, int auth_len)
{
  int pkt_leap;
  int source_is_synchronized;
  double pkt_root_delay;
  double pkt_root_dispersion;

  unsigned long auth_key_id;

  /* The local time to which the (offset, delay, dispersion) triple will
     be taken to relate.  For client/server operation this is practically
     the same as either the transmit or receive time.  The difference comes
     in symmetric active mode, when the receive may come minutes after the transmit, and this time
     will be midway between the two */
  struct timeval sample_time;

  /* The estimated offset (nomenclature from RFC1305 section 3.4.4).
     In seconds, a positive value indicates that the local clock is
     SLOW of the remote source and a negative value indicates that the local
     clock is FAST of the remote source. */
  double theta;

  /* The estimated round delay in seconds */
  double delta;

  /* The estimated peer dispersion in seconds */
  double epsilon;

  /* The estimated peer distance in seconds */
  double peer_distance;

  /* The total root delay */
  double root_delay;

  /* The total root dispersion */
  double root_dispersion;

  /* The skew relative to the remote source */
  double skew;

  /* The estimated skew relative to the remote source. */
  double source_freq_lo, source_freq_hi;

  /* These are the timeval equivalents of the remote epochs */  
  struct timeval remote_receive_tv, remote_transmit_tv;
  struct timeval remote_reference_tv;
  struct timeval local_average, remote_average;
  double local_interval, remote_interval;

  int test1, test2, test3, test4, test5, test6, test7, test7i, test7ii, test8;

  int test4a, test4b, test4c;

  /* In the words of section 3.4.4 of RFC1305, valid_data means
     that the NTP protocol association with the peer/server is
     properly synchronised.  valid_header means that the measurement
     obtained from the packet is suitable for use in synchronising
     our local clock.  Wierd choice of terminology. */

  int valid_data, valid_header;
  int good_data, good_header;

  /* Kiss-of-Death packets */
  int kod_rate = 0;
  int valid_kod;

  /* Variables used for doing logging */
  static char sync_stats[4] = {'N', '+', '-', '?'};

  /* The estimated offset predicted from previous samples.  The
     convention here is that positive means local clock FAST of
     reference, i.e. backwards to the way that 'theta' is defined. */
  double estimated_offset;

  /* The absolute difference between the offset estimate and
     measurement in seconds */
  double error_in_estimate;
  double delay_time = 0;
  int requeue_transmit = 0;

  /* ==================== */

  /* Save local receive timestamp */
  inst->local_rx = *now;

  pkt_leap = (message->lvm >> 6) & 0x3;
  if (pkt_leap == 0x3) {
    source_is_synchronized = 0;
  } else {
    source_is_synchronized = 1;
  }

  pkt_root_delay = UTI_Int32ToDouble(message->root_delay);
  pkt_root_dispersion = UTI_Int32ToDouble(message->root_dispersion);

  /* Perform packet validity tests */
  
  /* Test 1 requires that pkt.xmt != peer.org.  This protects
     against receiving a duplicate packet */

  if ((message->transmit_ts.hi == inst->remote_orig.hi) &&
      (message->transmit_ts.lo == inst->remote_orig.lo)) {
    test1 = 0; /* Failed */
  } else {
    test1 = 1; /* Success */
  }

  /* Test 2 requires pkt.org == peer.xmt.  This ensures the source
     is responding to the latest packet we sent to it. */
  if ((message->originate_ts.hi != inst->local_ntp_tx.hi) || 
      (message->originate_ts.lo != inst->local_ntp_tx.lo)) {
    test2 = 0; /* Failed */
  } else {
    test2 = 1; /* Success */
  }

  /* Regardless of any validity checks we apply, we are required to
     save this field from the packet into the ntp source
     instance record.  See RFC1305 section 3.4.4, peer.org <- pkt.xmt
     & peer.peerpoll <- pkt.poll.  Note we can't do this assignment
     before test1 has been carried out!! */

  inst->remote_orig = message->transmit_ts;

  /* Test 3 requires that pkt.org != 0 and pkt.rec != 0.  If
     either of these are true it means the association is not properly
     'up'. */
  
  if (((message->originate_ts.hi == 0) && (message->originate_ts.lo == 0)) ||
      ((message->receive_ts.hi == 0) && (message->receive_ts.lo == 0))) {
    test3 = 0; /* Failed */
  } else {
    test3 = 1; /* Success */
  }

  SRC_GetFrequencyRange(inst->source, &source_freq_lo, &source_freq_hi);

  UTI_Int64ToTimeval(&message->receive_ts, &remote_receive_tv);
  UTI_Int64ToTimeval(&message->transmit_ts, &remote_transmit_tv);

  if (test3) {
    
    UTI_AverageDiffTimevals(&remote_receive_tv, &remote_transmit_tv,
                            &remote_average, &remote_interval);

    UTI_AverageDiffTimevals(&inst->local_tx, now,
                            &local_average, &local_interval);

    /* In our case, we work out 'delta' as the worst case delay,
       assuming worst case frequency error between us and the other
       source */
    
    delta = local_interval - remote_interval * (1.0 + source_freq_lo);
    
    /* Calculate theta.  Following the NTP definition, this is negative
       if we are fast of the remote source. */
    
    UTI_DiffTimevalsToDouble(&theta, &remote_average, &local_average);
    
    /* We treat the time of the sample as being midway through the local
       measurement period.  An analysis assuming constant relative
       frequency and zero network delay shows this is the only possible
       choice to estimate the frequency difference correctly for every
       sample pair. */
    sample_time = local_average;
    
    /* Calculate skew */
    skew = (source_freq_hi - source_freq_lo) / 2.0;
    
    /* and then calculate peer dispersion */
    epsilon = LCL_GetSysPrecisionAsQuantum() + now_err + skew * fabs(local_interval);
    
  } else {
    /* If test3 failed, we probably can't calculate these quantities
       properly (e.g. for the first sample received in a peering
       connection). */
    theta = delta = epsilon = 0.0;
    sample_time = *now;
  }
  
  peer_distance = epsilon + 0.5 * fabs(delta);
  
  /* Test 4 requires that the round trip delay to the source and the
     source (RFC1305 'peer') dispersion are less than a cutoff value */

  if ((fabs(delta) >= NTP_MAX_DISPERSION) ||
      (epsilon >= NTP_MAX_DISPERSION)) {
    test4 = 0; /* Failed */
  } else {
    test4 = 1; /* Success */
  }

  /* Test 4a (additional to RFC1305) requires that the round trip
     delay is less than an administrator-defined value */

  if (fabs(delta) > inst->max_delay) {
    test4a = 0; /* Failed */
  } else {
    test4a = 1; /* Success */
  }

  /* Test 4b (additional to RFC1305) requires that the ratio of the
     round trip delay to the minimum one currently in the stats data
     register is less than an administrator-defined value */

  if (inst->max_delay_ratio > 1.0 &&
      fabs(delta/SRC_MinRoundTripDelay(inst->source)) > inst->max_delay_ratio) {
    test4b = 0; /* Failed */
  } else {
    test4b = 1; /* Success */
  }

  /* Test 4c (additional to RFC1305) requires that the ratio of the
     increase in delay from the minimum one in the stats data register to
     the standard deviation of the offsets in the register is less than an
     administrator-defined value or the difference between measured offset
     and predicted offset is larger than the increase in delay */
  if (!SRC_IsGoodSample(inst->source, -theta, fabs(delta),
        inst->max_delay_dev_ratio, LCL_GetMaxClockError(), &sample_time)) {
    test4c = 0; /* Failed */
  } else {
    test4c = 1; /* Success */
  }

  /* Test 5 relates to authentication. */
  if (inst->do_auth) {
    if (auth_len > 0) {
      auth_key_id = ntohl(message->auth_keyid);
      test5 = check_packet_auth(message, auth_key_id, auth_len);
    } else {
      /* If we expect authenticated info from this peer/server and the packet
         doesn't have it, it's got to fail */
      test5 = 0;
    }
  } else {
    /* If the peer or server sends us an authenticated frame, but
       we're not bothered about whether he authenticates or not, just
       ignore the test. */
    test5 = 1;
  }

  /* Test 6 checks that (i) the remote clock is synchronised (ii) the
     transmit timestamp is not before the time it was synchronized (clearly
     bogus if it is), and (iii) that it was not synchronised too long ago
     */
  UTI_Int64ToTimeval(&message->reference_ts, &remote_reference_tv);
  if ((!source_is_synchronized) ||
      (UTI_CompareTimevals(&remote_reference_tv, &remote_transmit_tv) == 1) ||
      ((remote_reference_tv.tv_sec + NTP_MAXAGE - remote_transmit_tv.tv_sec) < 0)) {
    test6 = 0; /* Failed */
  } else {
    test6 = 1; /* Succeeded */
  }

  /* (WGU) Set stratum to greater than any valid if incoming is 0 */
  /* as per the NPT v4 documentation*/
  if (message->stratum <= NTP_INVALID_STRATUM) {
    message->stratum = NTP_MAX_STRATUM + 1;
  }

  /* Increase stratum to the configured minimum */
  if (message->stratum < inst->min_stratum) {
    message->stratum = inst->min_stratum;
  }

  /* Test 7i checks that the stratum in the packet is valid */
  if (message->stratum > NTP_MAX_STRATUM) {
    test7i = 0; /* Failed */
  } else {
    test7i = 1;
  }

  /* Test 7ii checks that the stratum in the packet is not higher than ours */
  if (message->stratum > REF_GetOurStratum()) {
    test7ii = 0; /* Failed */
  } else {
    test7ii = 1;
  }

  test7 = test7i && test7ii;

  /* Test 8 checks that the root delay and dispersion quoted in 
     the packet are appropriate */
  if ((pkt_root_delay >= NTP_MAX_DISPERSION) ||
      (pkt_root_dispersion >= NTP_MAX_DISPERSION)) {
    test8 = 0; /* Failed */
  } else {
    test8 = 1;
  }

  /* Check for Kiss-of-Death */
  if (!test7i && !source_is_synchronized) {
      if (!memcmp(&message->reference_id, "RATE", 4))
        kod_rate = 1;
  }

  valid_kod = test1 && test2 && test5;

  valid_data = test1 && test2 && test3 && test4 && test4a && test4b;
  good_data = valid_data && test4c;
  valid_header = test5 && test6 && test7i && test8;
  good_header = valid_header && test7ii;

  root_delay = pkt_root_delay + fabs(delta);
  root_dispersion = pkt_root_dispersion + epsilon;

  DEBUG_LOG(LOGF_NtpCore, "lvm=%o stratum=%d poll=%d prec=%d",
      message->lvm, message->stratum, message->poll, message->precision);
  DEBUG_LOG(LOGF_NtpCore, "Root delay=%08x (%f), dispersion=%08x (%f)",
      message->root_delay, pkt_root_delay, message->root_dispersion, pkt_root_dispersion);
  DEBUG_LOG(LOGF_NtpCore, "Ref id=[%x], ref_time=%08x.%08x [%s]",
      ntohl(message->reference_id),
      message->reference_ts.hi, message->reference_ts.lo,
      UTI_TimestampToString(&message->reference_ts));
  DEBUG_LOG(LOGF_NtpCore, "Originate=%08x.%08x [%s]",
      message->originate_ts.hi, message->originate_ts.lo,
      UTI_TimestampToString(&message->originate_ts));
  DEBUG_LOG(LOGF_NtpCore, "Message receive=%08x.%08x [%s]",
      message->receive_ts.hi, message->receive_ts.lo,
      UTI_TimestampToString(&message->receive_ts));

  DEBUG_LOG(LOGF_NtpCore, "Transmit=%08x.%08x [%s]",
      message->transmit_ts.hi, message->transmit_ts.lo,
      UTI_TimestampToString(&message->transmit_ts));

  DEBUG_LOG(LOGF_NtpCore, "theta=%f delta=%f epsilon=%f root_delay=%f root_dispersion=%f",
      theta, delta, epsilon, root_delay, root_dispersion);

  DEBUG_LOG(LOGF_NtpCore, "test1=%d test2=%d test3=%d test4=%d valid_data=%d good_data=%d",
      test1, test2, test3, test4, valid_data, good_data);

  DEBUG_LOG(LOGF_NtpCore, "test5=%d test6=%d test7=%d test8=%d valid_header=%d good_header=%d",
      test5, test6, test7, test8, valid_header, good_header);

  DEBUG_LOG(LOGF_NtpCore, "kod_rate=%d valid_kod=%d", kod_rate, valid_kod);

  /* Reduce polling rate if KoD RATE was received */
  if (kod_rate && valid_kod) {
    if (message->poll > inst->minpoll) {
      /* Set our minpoll to message poll, but use a reasonable maximum */
      if (message->poll <= MAX_KOD_RATE_POLL)
        inst->minpoll = message->poll;
      else if (inst->minpoll < MAX_KOD_RATE_POLL)
        inst->minpoll = MAX_KOD_RATE_POLL;

      if (inst->minpoll > inst->maxpoll)
        inst->maxpoll = inst->minpoll;
      if (inst->minpoll > inst->local_poll)
        inst->local_poll = inst->minpoll;

      LOG(LOGS_WARN, LOGF_NtpCore,
          "Received KoD RATE with poll %d from %s, minpoll set to %d",
          message->poll, UTI_IPToString(&inst->remote_addr.ip_addr),
          inst->minpoll);
    }

    /* Stop ongoing burst */
    if (inst->opmode == MD_BURST_WAS_OFFLINE || inst->opmode == MD_BURST_WAS_ONLINE) {
      inst->burst_good_samples_to_go = 0;
      LOG(LOGS_WARN, LOGF_NtpCore, "Received KoD RATE from %s, burst sampling stopped",
          UTI_IPToString(&inst->remote_addr.ip_addr));
    }

    requeue_transmit = 1;
  }

  if (valid_header && valid_data) {
    inst->remote_poll = message->poll;
    inst->remote_stratum = message->stratum;
    inst->tx_count = 0;
    SRC_UpdateReachability(inst->source, 1);

    /* Mark the source as suitable for synchronisation when both header and
       data are good, unmark when header is not good (i.e. the stratum is
       higher than ours) */
    if (good_header) {
      if (good_data) {
        SRC_SetSelectable(inst->source);
      }
    } else {
      SRC_UnsetSelectable(inst->source);
    }

    if (good_data) {
      /* Do this before we accumulate a new sample into the stats registers, obviously */
      estimated_offset = SRC_PredictOffset(inst->source, &sample_time);

      SRC_AccumulateSample(inst->source,
                           &sample_time,
                           theta, fabs(delta), epsilon,
                           root_delay, root_dispersion,
                           message->stratum, (NTP_Leap) pkt_leap);

      SRC_SelectSource(inst->source);

      /* Now examine the registers.  First though, if the prediction is
         not even within +/- the peer distance of the peer, we are clearly
         not tracking the peer at all well, so we back off the sampling
         rate depending on just how bad the situation is. */
      error_in_estimate = fabs(-theta - estimated_offset);

      /* Now update the polling interval */
      adjust_poll(inst, get_poll_adj(inst, error_in_estimate, peer_distance));

      /* If we're in burst mode, check whether the burst is completed and
         revert to the previous mode */
      switch (inst->opmode) {
        case MD_BURST_WAS_ONLINE:
        case MD_BURST_WAS_OFFLINE:
          --inst->burst_good_samples_to_go;
          if (inst->burst_good_samples_to_go <= 0) {
            if (inst->opmode == MD_BURST_WAS_ONLINE)
              inst->opmode = MD_ONLINE;
            else
              take_offline(inst);
          }
          break;
        default:
          break;
      }
    } else {
      /* Slowly increase the polling interval if we can't get good_data */
      adjust_poll(inst, 0.1);
    }

    requeue_transmit = 1;
  }

  /* And now, requeue the timer. */
  if (requeue_transmit && inst->opmode != MD_OFFLINE) {
    delay_time = get_transmit_delay(inst, 0, local_interval);

    if (kod_rate) {
      /* Back off for a while */
      delay_time += (double) (4 * (1UL << inst->minpoll));
    }

    /* Get rid of old timeout and start a new one */
    assert(inst->timer_running);
    SCH_RemoveTimeout(inst->timeout_id);
    inst->timeout_id = SCH_AddTimeoutInClass(delay_time, SAMPLING_SEPARATION,
                                             SAMPLING_RANDOMNESS,
                                             SCH_NtpSamplingClass,
                                             transmit_timeout, (void *)inst);
  }

  /* Do measurement logging */
  if (logfileid != -1) {
    LOG_FileWrite(logfileid, "%s %-15s %1c %2d %1d%1d%1d%1d %1d%1d%1d %1d%1d%1d%1d %2d %2d %4.2f %10.3e %10.3e %10.3e %10.3e %10.3e",
            UTI_TimeToLogForm(sample_time.tv_sec),
            UTI_IPToString(&inst->remote_addr.ip_addr),
            sync_stats[pkt_leap],
            message->stratum,
            test1, test2, test3, test4,
            test4a, test4b, test4c,
            test5, test6, test7, test8,
            inst->local_poll, inst->remote_poll,
            inst->poll_score,
            theta, delta, epsilon,
            pkt_root_delay, pkt_root_dispersion);
  }            
}

/* ================================================== */
/* From RFC1305, the standard handling of receive packets, depending
   on the mode of the packet and of the source, is :

          Source mode>>>
   Packet
   mode       active  passive  client   server  bcast
   vvv

   active     recv    pkt      recv     xmit    xmit
   passive    recv    error    recv     error   error
   client     xmit    xmit     error    xmit    xmit
   server     recv    error    recv     error   error
   bcast      recv    error    recv     error   error

   We ignore broadcasts in this implementation - they create too many
   problems.

 */

/* ================================================== */
/* This routine is called when a new packet arrives off the network,
   and it relates to a source we have an ongoing protocol exchange with */

void
NCR_ProcessKnown
(NTP_Packet *message,           /* the received message */
 struct timeval *now,           /* timestamp at time of receipt */
 double now_err,
 NCR_Instance inst,             /* the instance record for this peer/server */
 int sock_fd,                   /* the receiving socket */
 int length                     /* the length of the received packet */
 )
{
  int pkt_mode;
  int version;
  int auth_len;

  /* Make sure the packet was received by the sending socket */
  if (sock_fd != inst->local_addr.sock_fd) {
    DEBUG_LOG(LOGF_NtpCore,
              "Packet received by wrong socket %d (expected %d)",
              sock_fd, inst->local_addr.sock_fd);
    return;
  }

  /* Ignore packets from offline sources */
  if (inst->opmode == MD_OFFLINE || inst->tx_suspended) {
    return;
  }

  /* Check version */
  version = (message->lvm >> 3) & 0x7;
  if (version < NTP_MIN_COMPAT_VERSION || version > NTP_MAX_COMPAT_VERSION) {
    /* Ignore packet, but might want to log it */
    return;
  } 

  /* Perform tests mentioned in RFC1305 to validate packet contents */
  pkt_mode = (message->lvm >> 0) & 0x7;

  /* Length of the authentication data, if any */
  auth_len = length - (NTP_NORMAL_PACKET_SIZE + sizeof (message->auth_keyid));
  if (auth_len < 0) {
    auth_len = 0;
  }

  /* Now, depending on the mode we decide what to do */
  switch (pkt_mode) {
    case MODE_CLIENT:
      /* If message is client mode, we just respond with a server mode
         packet, regardless of what we think the remote machine is
         supposed to be.  However, even though this is a configured
         peer or server, we still implement access restrictions on
         client mode operation.

         This is an extension to RFC1305, as we don't bother to check
         whether we are a client of the remote machine.

         This copes with the case for an isolated network where one
         machine is set by eye and is used as the master, with the
         other machines pointed at it.  If the master goes down, we
         want to be able to reset its time at startup by relying on
         one of the secondaries to flywheel it. The behaviour coded here
         is required in the secondaries to make this possible. */

      NCR_ProcessUnknown(message, now, now_err,
                         &inst->remote_addr, &inst->local_addr, length);

      break;

    case MODE_ACTIVE:

      switch(inst->mode) {
        case MODE_ACTIVE:
          /* Ordinary symmetric peering */
          CLG_LogNTPPeerAccess(&inst->remote_addr.ip_addr, (time_t) now->tv_sec);
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_PASSIVE:
          /* In this software this case should not arise, we don't
             support unconfigured peers */
          break;
        case MODE_CLIENT:
          /* This is where we have the remote configured as a server and he has
             us configured as a peer - fair enough. */
          CLG_LogNTPPeerAccess(&inst->remote_addr.ip_addr, (time_t) now->tv_sec);
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_SERVER:
          /* Nonsense - we can't have a preconfigured server */
          break;
        case MODE_BROADCAST:
          /* We don't handle broadcasts */
          break;
        default:
          /* Obviously ignore */
          break;
      }

      break;

    case MODE_SERVER:

      switch(inst->mode) {
        case MODE_ACTIVE:
          /* Slightly bizarre combination, but we can still process it */
          CLG_LogNTPPeerAccess(&inst->remote_addr.ip_addr, (time_t) now->tv_sec);
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_PASSIVE:
          /* We have no passive peers in this software */
          break;
        case MODE_CLIENT:
          /* Standard case where he's a server and we're the client */
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_SERVER:
          /* RFC1305 error condition. */
          break;
        case MODE_BROADCAST:
          /* RFC1305 error condition */
          break;
        default:
          /* Obviously ignore */
          break;
      }
      break;

    case MODE_PASSIVE:

      switch(inst->mode) {
        case MODE_ACTIVE:
          /* This would arise if we have the remote configured as a peer and
             he does not have us configured */
          CLG_LogNTPPeerAccess(&inst->remote_addr.ip_addr, (time_t) now->tv_sec);
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_PASSIVE:
          /* Error condition in RFC1305.  Also, we can't have any
             non-transient PASSIVE sources in this version, we only
             allow configured peers! */
          break;
        case MODE_CLIENT:
          /* This is a wierd combination - how could it arise? */
          receive_packet(message, now, now_err, inst, auth_len);
          break;
        case MODE_SERVER:
          /* Error condition in RFC1305 */
          break;
        case MODE_BROADCAST:
          /* Error condition in RFC1305 */
          break;
        default:
          /* Obviously ignore */
          break;
      }
      break;

    case MODE_BROADCAST:
      /* Just ignore these, but might want to log them */
      break;

    default:
      /* Obviously ignore */
      break;
      
  }
}

/* ================================================== */
/* This routine is called when a new packet arrives off the network,
   and it relates to a source we don't know (not our server or peer) */

void
NCR_ProcessUnknown
(NTP_Packet *message,           /* the received message */
 struct timeval *now,           /* timestamp at time of receipt */
 double now_err,                /* assumed error in the timestamp */
 NTP_Remote_Address *remote_addr,
 NTP_Local_Address *local_addr,
 int length                     /* the length of the received packet */
 )
{
  NTP_Mode his_mode;
  NTP_Mode my_mode;
  int my_poll, version;
  int valid_auth, auth_len;
  unsigned long key_id;

  /* Ignore the packet if it wasn't received by server socket */
  if (!NIO_IsServerSocket(local_addr->sock_fd)) {
    DEBUG_LOG(LOGF_NtpCore, "NTP request packet received by client socket %d",
              local_addr->sock_fd);
    return;
  }

  /* Check version */
  version = (message->lvm >> 3) & 0x7;
  if (version < NTP_MIN_COMPAT_VERSION || version > NTP_MAX_COMPAT_VERSION) {
    /* Ignore packet, but might want to log it */
    return;
  }

  if (ADF_IsAllowed(access_auth_table, &remote_addr->ip_addr)) {

    his_mode = message->lvm & 0x07;
    
    if (his_mode == MODE_CLIENT) {
      /* We are server */
      my_mode = MODE_SERVER;
      CLG_LogNTPClientAccess(&remote_addr->ip_addr, (time_t) now->tv_sec);

    } else if (his_mode == MODE_ACTIVE) {
      /* We are symmetric passive, even though we don't ever lock to him */
      my_mode = MODE_PASSIVE;
      CLG_LogNTPPeerAccess(&remote_addr->ip_addr, (time_t) now->tv_sec);

    } else {
      my_mode = MODE_UNDEFINED;
    }
    
    /* If we can't determine a sensible mode to reply with, it means
       he has supplied a wierd mode in his request, so ignore it. */

    if (my_mode != MODE_UNDEFINED) {
      int do_auth = 0;
      auth_len = length - (NTP_NORMAL_PACKET_SIZE + sizeof (message->auth_keyid));

      if (auth_len > 0) {
        /* Only reply if we know the key and the packet authenticates
           properly. */
        key_id = ntohl(message->auth_keyid);
        do_auth = 1;
        valid_auth = check_packet_auth(message, key_id, auth_len);
      }

      if (!do_auth || valid_auth) {
        /* Reply with the same poll, the client may use it to control its poll */
        my_poll = message->poll;

        transmit_packet(my_mode, my_poll,
                        version,
                        do_auth, do_auth ? key_id : 0,
                        &message->transmit_ts, /* Originate (for us) is the transmit time for the client */
                        now, /* Time we received the packet */
                        NULL, /* Don't care when we send reply, we aren't maintaining state about this client */
                        NULL, /* Ditto */
                        remote_addr,
                        local_addr);
      }
    }
  } else {
    DEBUG_LOG(LOGF_NtpCore, "NTP packet received from unauthorised host %s port %d",
        UTI_IPToString(&remote_addr->ip_addr),
        remote_addr->port);
  }
}

/* ================================================== */

void
NCR_SlewTimes(NCR_Instance inst, struct timeval *when, double dfreq, double doffset)
{
  struct timeval prev;
  double delta;
  prev = inst->local_rx;
  if (inst->local_rx.tv_sec || inst->local_rx.tv_usec)
    UTI_AdjustTimeval(&inst->local_rx, when, &inst->local_rx, &delta, dfreq, doffset);
  DEBUG_LOG(LOGF_NtpCore, "rx prev=[%s] new=[%s]",
      UTI_TimevalToString(&prev), UTI_TimevalToString(&inst->local_rx));
  prev = inst->local_tx;
  if (inst->local_tx.tv_sec || inst->local_tx.tv_usec)
    UTI_AdjustTimeval(&inst->local_tx, when, &inst->local_tx, &delta, dfreq, doffset);
  DEBUG_LOG(LOGF_NtpCore, "tx prev=[%s] new=[%s]",
      UTI_TimevalToString(&prev), UTI_TimevalToString(&inst->local_tx));
}

/* ================================================== */

void
NCR_TakeSourceOnline(NCR_Instance inst)
{
  switch (inst->opmode) {
    case MD_ONLINE:
      /* Nothing to do */
      break;
    case MD_OFFLINE:
      LOG(LOGS_INFO, LOGF_NtpCore, "Source %s online", UTI_IPToString(&inst->remote_addr.ip_addr));
      inst->opmode = MD_ONLINE;
      NCR_ResetInstance(inst);
      start_initial_timeout(inst);
      break;
    case MD_BURST_WAS_ONLINE:
      /* Will revert */
      break;
    case MD_BURST_WAS_OFFLINE:
      inst->opmode = MD_BURST_WAS_ONLINE;
      LOG(LOGS_INFO, LOGF_NtpCore, "Source %s online", UTI_IPToString(&inst->remote_addr.ip_addr));
      break;
  }
}

/* ================================================== */

void
NCR_TakeSourceOffline(NCR_Instance inst)
{
  switch (inst->opmode) {
    case MD_ONLINE:
      LOG(LOGS_INFO, LOGF_NtpCore, "Source %s offline", UTI_IPToString(&inst->remote_addr.ip_addr));
      take_offline(inst);
      break;
    case MD_OFFLINE:
      break;
    case MD_BURST_WAS_ONLINE:
      inst->opmode = MD_BURST_WAS_OFFLINE;
      LOG(LOGS_INFO, LOGF_NtpCore, "Source %s offline", UTI_IPToString(&inst->remote_addr.ip_addr));
      break;
    case MD_BURST_WAS_OFFLINE:
      break;
  }

}

/* ================================================== */

void
NCR_ModifyMinpoll(NCR_Instance inst, int new_minpoll)
{
  if (new_minpoll < MIN_POLL)
    return;
  inst->minpoll = new_minpoll;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new minpoll %d", UTI_IPToString(&inst->remote_addr.ip_addr), new_minpoll);
  if (inst->maxpoll < inst->minpoll)
    NCR_ModifyMaxpoll(inst, inst->minpoll);
}

/* ================================================== */

void
NCR_ModifyMaxpoll(NCR_Instance inst, int new_maxpoll)
{
  if (new_maxpoll < MIN_POLL)
    return;
  inst->maxpoll = new_maxpoll;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new maxpoll %d", UTI_IPToString(&inst->remote_addr.ip_addr), new_maxpoll);
  if (inst->minpoll > inst->maxpoll)
    NCR_ModifyMinpoll(inst, inst->maxpoll);
}

/* ================================================== */

void
NCR_ModifyMaxdelay(NCR_Instance inst, double new_max_delay)
{
  inst->max_delay = new_max_delay;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new max delay %f",
      UTI_IPToString(&inst->remote_addr.ip_addr), new_max_delay);
}

/* ================================================== */

void
NCR_ModifyMaxdelayratio(NCR_Instance inst, double new_max_delay_ratio)
{
  inst->max_delay_ratio = new_max_delay_ratio;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new max delay ratio %f",
      UTI_IPToString(&inst->remote_addr.ip_addr), new_max_delay_ratio);
}

/* ================================================== */

void
NCR_ModifyMaxdelaydevratio(NCR_Instance inst, double new_max_delay_dev_ratio)
{
  inst->max_delay_dev_ratio = new_max_delay_dev_ratio;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new max delay dev ratio %f",
      UTI_IPToString(&inst->remote_addr.ip_addr), new_max_delay_dev_ratio);
}

/* ================================================== */

void
NCR_ModifyMinstratum(NCR_Instance inst, int new_min_stratum)
{
  inst->min_stratum = new_min_stratum;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new minstratum %d",
      UTI_IPToString(&inst->remote_addr.ip_addr), new_min_stratum);
}

/* ================================================== */

void
NCR_ModifyPolltarget(NCR_Instance inst, int new_poll_target)
{
  inst->poll_target = new_poll_target;
  LOG(LOGS_INFO, LOGF_NtpCore, "Source %s new polltarget %d",
      UTI_IPToString(&inst->remote_addr.ip_addr), new_poll_target);
}

/* ================================================== */

void
NCR_InitiateSampleBurst(NCR_Instance inst, int n_good_samples, int n_total_samples)
{

  if (inst->mode == MODE_CLIENT) {

    /* We want to prevent burst mode being used on symmetric active
       associations - it will play havoc with the peer's sampling
       strategy. (This obviously relies on us having the peer
       configured that way if he has us configured symmetric active -
       but there's not much else we can do.) */

    switch (inst->opmode) {
      case MD_BURST_WAS_OFFLINE:
      case MD_BURST_WAS_ONLINE:
        /* If already burst sampling, don't start again */
        break;

      case MD_ONLINE:
      case MD_OFFLINE:
        inst->opmode = inst->opmode == MD_ONLINE ?
          MD_BURST_WAS_ONLINE : MD_BURST_WAS_OFFLINE;
        inst->burst_good_samples_to_go = n_good_samples;
        inst->burst_total_samples_to_go = n_total_samples;
        start_initial_timeout(inst);
        break;
      default:
        assert(0);
        break;
    }
  }

}

/* ================================================== */

void
NCR_ReportSource(NCR_Instance inst, RPT_SourceReport *report, struct timeval *now)
{
  report->poll = inst->local_poll;

  switch (inst->mode) {
    case MODE_CLIENT:
      report->mode = RPT_NTP_CLIENT;
      break;
    case MODE_ACTIVE:
      report->mode = RPT_NTP_PEER;
      break;
    default:
      assert(0);
  }
}

/* ================================================== */

int
NCR_AddAccessRestriction(IPAddr *ip_addr, int subnet_bits, int allow, int all)
 {
  ADF_Status status;

  if (allow) {
    if (all) {
      status = ADF_AllowAll(access_auth_table, ip_addr, subnet_bits);
    } else {
      status = ADF_Allow(access_auth_table, ip_addr, subnet_bits);
    }
  } else {
    if (all) {
      status = ADF_DenyAll(access_auth_table, ip_addr, subnet_bits);
    } else {
      status = ADF_Deny(access_auth_table, ip_addr, subnet_bits);
    }
  }

  if (status == ADF_BADSUBNET) {
    return 0;
  } else if (status == ADF_SUCCESS) {
    return 1;
  } else {
    return 0;
  }
}

/* ================================================== */

int
NCR_CheckAccessRestriction(IPAddr *ip_addr)
{
  return ADF_IsAllowed(access_auth_table, ip_addr);
}

/* ================================================== */

void
NCR_IncrementActivityCounters(NCR_Instance inst, int *online, int *offline,
                              int *burst_online, int *burst_offline)
{
  switch (inst->opmode) {
    case MD_BURST_WAS_OFFLINE:
      ++*burst_offline;
      break;
    case MD_BURST_WAS_ONLINE:
      ++*burst_online;
      break;
    case MD_ONLINE:
      ++*online;
      break;
    case MD_OFFLINE:
      ++*offline;
      break;
    default:
      assert(0);
      break;
  }
}

/* ================================================== */

NTP_Remote_Address *
NCR_GetRemoteAddress(NCR_Instance inst) 
{
  return &inst->remote_addr;
}

/* ================================================== */

int NCR_IsSyncPeer(NCR_Instance inst)
{
  return SRC_IsSyncPeer(inst->source);
}

/* ================================================== */
