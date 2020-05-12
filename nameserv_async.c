/*
  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Miroslav Lichvar  2014
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

  Functions to asynchronously convert name to IP address

  */

#include "config.h"
#include "sysincl.h"

#include "nameserv_async.h"
#include "logging.h"
#include "memory.h"
#include "sched.h"
#include "util.h"

#ifdef FEAT_ASYNCDNS

#ifdef USE_PTHREAD_ASYNCDNS
#include <pthread.h>

/* ================================================== */

struct DNS_Async_Instance {
  const char *name;
  DNS_Status status;
  IPAddr addr;
  DNS_NameResolveHandler handler;
  void *arg;

  pthread_t thread;
  int pipe[2];
};

static int resolving_threads = 0;

/* ================================================== */

static void *
start_resolving(void *anything)
{
  struct DNS_Async_Instance *inst = (struct DNS_Async_Instance *)anything;

  inst->status = DNS_Name2IPAddress(inst->name, &inst->addr);

  /* Notify the main thread that the result is ready */
  if (write(inst->pipe[1], "", 1) < 0)
    ;

  return NULL;
}

/* ================================================== */

static void
end_resolving(void *anything)
{
  struct DNS_Async_Instance *inst = (struct DNS_Async_Instance *)anything;

  if (pthread_join(inst->thread, NULL)) {
    LOG_FATAL(LOGF_Nameserv, "pthread_join() failed");
  }

  resolving_threads--;

  SCH_RemoveInputFileHandler(inst->pipe[0]);
  close(inst->pipe[0]);
  close(inst->pipe[1]);

  (inst->handler)(inst->status, &inst->addr, inst->arg);

  Free(inst);
}

/* ================================================== */

void
DNS_Name2IPAddressAsync(const char *name, DNS_NameResolveHandler handler, void *anything)
{
  struct DNS_Async_Instance *inst;

  inst = MallocNew(struct DNS_Async_Instance);
  inst->name = name;
  inst->handler = handler;
  inst->arg = anything;
  inst->status = DNS_Failure;

  if (pipe(inst->pipe)) {
    LOG_FATAL(LOGF_Nameserv, "pipe() failed");
  }

  resolving_threads++;
  assert(resolving_threads <= 1);

  if (pthread_create(&inst->thread, NULL, start_resolving, inst)) {
    LOG_FATAL(LOGF_Nameserv, "pthread_create() failed");
  }

  SCH_AddInputFileHandler(inst->pipe[0], end_resolving, inst);
}

/* ================================================== */

#else
#error
#endif

#else

/* This is a blocking implementation used when nothing else is available */

void
DNS_Name2IPAddressAsync(const char *name, DNS_NameResolveHandler handler, void *anything)
{
  IPAddr addr;
  DNS_Status status;

  status = DNS_Name2IPAddress(name, &addr);
  (handler)(status, &addr, anything);
}

/* ================================================== */

#endif
