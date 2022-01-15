/*
 **********************************************************************
 * Copyright (C) Miroslav Lichvar  2016, 2021
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
 */

#include <config.h>
#include "test.h"

#if defined(FEAT_NTP) || defined(FEAT_CMDMON)

#include <clientlog.c>

static uint64_t
get_random64(void)
{
  return ((uint64_t)random() << 40) ^ ((uint64_t)random() << 20) ^ random();
}

void
test_unit(void)
{
  uint64_t ts64, prev_first_ts64, prev_last_ts64, max_step;
  uint32_t index2, prev_first, prev_size;
  struct timespec ts, ts2;
  int i, j, k, index, shift;
  CLG_Service s;
  NTP_int64 ntp_ts;
  IPAddr ip;
  char conf[][100] = {
    "clientloglimit 20000",
    "ratelimit interval 3 burst 4 leak 3",
    "cmdratelimit interval 3 burst 4 leak 3",
    "ntsratelimit interval 6 burst 8 leak 3",
  };

  CNF_Initialise(0, 0);
  for (i = 0; i < sizeof conf / sizeof conf[0]; i++)
    CNF_ParseLine(NULL, i + 1, conf[i]);

  LCL_Initialise();
  CLG_Initialise();

  TEST_CHECK(ARR_GetSize(records) == 16);

  for (i = 0; i < 500; i++) {
    DEBUG_LOG("iteration %d", i);

    ts.tv_sec = (time_t)random() & 0x0fffffff;
    ts.tv_nsec = 0;

    for (j = 0; j < 1000; j++) {
      TST_GetRandomAddress(&ip, IPADDR_UNSPEC, i % 8 ? -1 : i / 8 % 9);
      DEBUG_LOG("address %s", UTI_IPToString(&ip));

      s = random() % MAX_SERVICES;
      index = CLG_LogServiceAccess(s, &ip, &ts);
      TEST_CHECK(index >= 0);
      CLG_LimitServiceRate(s, index);

      UTI_AddDoubleToTimespec(&ts, (1 << random() % 14) / 100.0, &ts);
    }
  }

  DEBUG_LOG("records %u", ARR_GetSize(records));
  TEST_CHECK(ARR_GetSize(records) == 128);

  s = CLG_NTP;

  for (i = j = 0; i < 10000; i++) {
    ts.tv_sec += 1;
    index = CLG_LogServiceAccess(s, &ip, &ts);
    TEST_CHECK(index >= 0);
    if (!CLG_LimitServiceRate(s, index))
      j++;
  }

  DEBUG_LOG("requests %d responses %d", i, j);
  TEST_CHECK(j * 4 < i && j * 6 > i);

  TEST_CHECK(!ntp_ts_map.timestamps);

  UTI_ZeroNtp64(&ntp_ts);
  CLG_SaveNtpTimestamps(&ntp_ts, NULL);
  TEST_CHECK(ntp_ts_map.timestamps);
  TEST_CHECK(ntp_ts_map.first == 0);
  TEST_CHECK(ntp_ts_map.size == 0);
  TEST_CHECK(ntp_ts_map.max_size == 128);
  TEST_CHECK(ARR_GetSize(ntp_ts_map.timestamps) == ntp_ts_map.max_size);

  TEST_CHECK(ntp_ts_map.max_size > NTPTS_INSERT_LIMIT);

  for (i = 0; i < 200; i++) {
    DEBUG_LOG("iteration %d", i);

    max_step = (1ULL << (i % 50));
    ts64 = 0ULL - 100 * max_step;

    if (i > 150)
      ntp_ts_map.max_size = 1U << (i % 8);
    assert(ntp_ts_map.max_size <= 128);
    ntp_ts_map.first = i % ntp_ts_map.max_size;
    ntp_ts_map.size = 0;
    ntp_ts_map.cached_rx_ts = 0ULL;
    ntp_ts_map.slew_epoch = i * 400;

    for (j = 0; j < 500; j++) {
      do {
        ts64 += get_random64() % max_step + 1;
      } while (ts64 == 0ULL);

      int64_to_ntp64(ts64, &ntp_ts);

      if (random() % 10) {
        UTI_Ntp64ToTimespec(&ntp_ts, &ts);
        UTI_AddDoubleToTimespec(&ts, TST_GetRandomDouble(-1.999, 1.999), &ts);
      } else {
        UTI_ZeroTimespec(&ts);
      }

      CLG_SaveNtpTimestamps(&ntp_ts,
                            UTI_IsZeroTimespec(&ts) ? (random() % 2 ? &ts : NULL) : &ts);

      if (j < ntp_ts_map.max_size) {
        TEST_CHECK(ntp_ts_map.size == j + 1);
        TEST_CHECK(ntp_ts_map.first == i % ntp_ts_map.max_size);
      } else {
        TEST_CHECK(ntp_ts_map.size == ntp_ts_map.max_size);
        TEST_CHECK(ntp_ts_map.first == (i + j + ntp_ts_map.size + 1) % ntp_ts_map.max_size);
      }
      TEST_CHECK(ntp_ts_map.cached_index == ntp_ts_map.size - 1);
      TEST_CHECK(get_ntp_tss(ntp_ts_map.size - 1)->slew_epoch == ntp_ts_map.slew_epoch);
      TEST_CHECK(CLG_GetNtpTxTimestamp(&ntp_ts, &ts2));
      TEST_CHECK(UTI_CompareTimespecs(&ts, &ts2) == 0);

      for (k = random() % 4; k > 0; k--) {
        index2 = random() % ntp_ts_map.size;
        int64_to_ntp64(get_ntp_tss(index2)->rx_ts, &ntp_ts);
        if (random() % 2)
          TEST_CHECK(CLG_GetNtpTxTimestamp(&ntp_ts, &ts));

        UTI_Ntp64ToTimespec(&ntp_ts, &ts);
        UTI_AddDoubleToTimespec(&ts, TST_GetRandomDouble(-1.999, 1.999), &ts);

        ts2 = ts;
        CLG_UndoNtpTxTimestampSlew(&ntp_ts, &ts);
        if ((get_ntp_tss(index2)->slew_epoch + 1) % (1U << 16) != ntp_ts_map.slew_epoch) {
          TEST_CHECK(UTI_CompareTimespecs(&ts, &ts2) == 0);
        } else {
          TEST_CHECK(fabs(UTI_DiffTimespecsToDouble(&ts, &ts2) - ntp_ts_map.slew_offset) <
                     1.0e-9);
        }

        CLG_UpdateNtpTxTimestamp(&ntp_ts, &ts);

        TEST_CHECK(CLG_GetNtpTxTimestamp(&ntp_ts, &ts2));
        TEST_CHECK(UTI_CompareTimespecs(&ts, &ts2) == 0);

        if (random() % 2) {
          uint16_t prev_epoch = ntp_ts_map.slew_epoch;
          handle_slew(NULL, NULL, 0.0, TST_GetRandomDouble(-1.0e-5, 1.0e-5),
                      LCL_ChangeAdjust, NULL);
          TEST_CHECK((prev_epoch + 1) % (1U << 16) == ntp_ts_map.slew_epoch);
        }

        if (ntp_ts_map.size > 1) {
          index = random() % (ntp_ts_map.size - 1);
          if (get_ntp_tss(index)->rx_ts + 1 != get_ntp_tss(index + 1)->rx_ts) {
            int64_to_ntp64(get_ntp_tss(index)->rx_ts + 1, &ntp_ts);
            TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
            int64_to_ntp64(get_ntp_tss(index + 1)->rx_ts - 1, &ntp_ts);
            TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
            CLG_UpdateNtpTxTimestamp(&ntp_ts, &ts);
            CLG_UndoNtpTxTimestampSlew(&ntp_ts, &ts);
          }
        }

        if (random() % 2) {
          int64_to_ntp64(get_ntp_tss(0)->rx_ts - 1, &ntp_ts);
          TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
          int64_to_ntp64(get_ntp_tss(ntp_ts_map.size - 1)->rx_ts + 1, &ntp_ts);
          TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
          CLG_UpdateNtpTxTimestamp(&ntp_ts, &ts);
          CLG_UndoNtpTxTimestampSlew(&ntp_ts, &ts);
        }
      }
    }

    for (j = 0; j < 500; j++) {
      shift = (i % 3) * 26;

      if (i % 7 == 0) {
        while (ntp_ts_map.size < ntp_ts_map.max_size) {
          ts64 += get_random64() >> (shift + 8);
          int64_to_ntp64(ts64, &ntp_ts);
          CLG_SaveNtpTimestamps(&ntp_ts, NULL);
          if (ntp_ts_map.cached_index + NTPTS_INSERT_LIMIT < ntp_ts_map.size)
            ts64 = get_ntp_tss(ntp_ts_map.size - 1)->rx_ts;
        }
      }
      do {
        if (ntp_ts_map.size > 1 && random() % 2) {
          k = random() % (ntp_ts_map.size - 1);
          ts64 = get_ntp_tss(k)->rx_ts +
                 (get_ntp_tss(k + 1)->rx_ts - get_ntp_tss(k)->rx_ts) / 2;
        } else {
          ts64 = get_random64() >> shift;
        }
      } while (ts64 == 0ULL);

      int64_to_ntp64(ts64, &ntp_ts);

      prev_first = ntp_ts_map.first;
      prev_size = ntp_ts_map.size;
      prev_first_ts64 = get_ntp_tss(0)->rx_ts;
      prev_last_ts64 = get_ntp_tss(prev_size - 1)->rx_ts;
      CLG_SaveNtpTimestamps(&ntp_ts, NULL);

      TEST_CHECK(find_ntp_rx_ts(ts64, &index2));

      if (ntp_ts_map.size > 1) {
        TEST_CHECK(ntp_ts_map.size > 0 && ntp_ts_map.size <= ntp_ts_map.max_size);
        if (get_ntp_tss(index2)->flags & NTPTS_DISABLED)
          continue;

        TEST_CHECK(get_ntp_tss(ntp_ts_map.size - 1)->rx_ts - ts64 <= NTPTS_FUTURE_LIMIT);

        if ((int64_t)(prev_last_ts64 - ts64) <= NTPTS_FUTURE_LIMIT) {
          TEST_CHECK(prev_size + 1 >= ntp_ts_map.size);
          if (index2 + NTPTS_INSERT_LIMIT + 1 >= ntp_ts_map.size &&
              !(index2 == 0 && NTPTS_INSERT_LIMIT < ntp_ts_map.max_size &&
                ((NTPTS_INSERT_LIMIT == prev_size && (int64_t)(ts64 - prev_first_ts64) > 0) ||
                 (NTPTS_INSERT_LIMIT + 1 == prev_size && (int64_t)(ts64 - prev_first_ts64) < 0))))
            TEST_CHECK((prev_first + prev_size + 1) % ntp_ts_map.max_size ==
                       (ntp_ts_map.first + ntp_ts_map.size) % ntp_ts_map.max_size);
          else
            TEST_CHECK(prev_first + prev_size == ntp_ts_map.first + ntp_ts_map.size);
        }

        TEST_CHECK((int64_t)(get_ntp_tss(ntp_ts_map.size - 1)->rx_ts -
                             get_ntp_tss(0)->rx_ts) > 0);
        for (k = 0; k + 1 < ntp_ts_map.size; k++)
          TEST_CHECK((int64_t)(get_ntp_tss(k + 1)->rx_ts - get_ntp_tss(k)->rx_ts) > 0);
      }

      if (random() % 10 == 0) {
        CLG_DisableNtpTimestamps(&ntp_ts);
        TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
      }

      for (k = random() % 10; k > 0; k--) {
        ts64 = get_random64() >> shift;
        int64_to_ntp64(ts64, &ntp_ts);
        CLG_GetNtpTxTimestamp(&ntp_ts, &ts);
      }
    }

    if (random() % 2) {
      handle_slew(NULL, NULL, 0.0, TST_GetRandomDouble(-1.0e9, 1.0e9),
                  LCL_ChangeUnknownStep, NULL);
      TEST_CHECK(ntp_ts_map.size == 0);
      TEST_CHECK(ntp_ts_map.cached_rx_ts == 0ULL);
      TEST_CHECK(!CLG_GetNtpTxTimestamp(&ntp_ts, &ts));
      CLG_UpdateNtpTxTimestamp(&ntp_ts, &ts);
    }
  }

  CLG_Finalise();
  LCL_Finalise();
  CNF_Finalise();
}
#else
void
test_unit(void)
{
  TEST_REQUIRE(0);
}
#endif
