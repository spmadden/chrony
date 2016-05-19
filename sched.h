/*
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
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 * 
 **********************************************************************

  =======================================================================

  Exported header file for sched.c
  */

#ifndef GOT_SCHED_H
#define GOT_SCHED_H

#include "sysincl.h"

/* Type for timeout IDs, valid IDs are always greater than zero */
typedef unsigned int SCH_TimeoutID;

typedef enum {
  SCH_ReservedTimeoutValue = 0,
  SCH_NtpSamplingClass,
  SCH_NtpBroadcastClass,
  SCH_NumberOfClasses /* needs to be last */
} SCH_TimeoutClass;

typedef void* SCH_ArbitraryArgument;
typedef void (*SCH_FileHandler)(SCH_ArbitraryArgument);
typedef void (*SCH_TimeoutHandler)(SCH_ArbitraryArgument);

/* Exported functions */

/* Initialisation function for the module */
extern void SCH_Initialise(void);

/* Finalisation function for the module */
extern void SCH_Finalise(void);

/* Register a handler for when select goes true on a file descriptor */
extern void SCH_AddInputFileHandler
(int fd,                        /* The file descriptor */
 SCH_FileHandler,               /* The handler routine */
 SCH_ArbitraryArgument          /* An arbitrary passthrough argument to the handler */
);
extern void SCH_RemoveInputFileHandler(int fd);

/* Get the time stamp taken after a file descriptor became ready or a timeout expired */
extern void SCH_GetLastEventTime(struct timeval *cooked, double *err, struct timeval *raw);

/* This queues a timeout to elapse at a given (raw) local time */
extern SCH_TimeoutID SCH_AddTimeout(struct timeval *tv, SCH_TimeoutHandler, SCH_ArbitraryArgument);

/* This queues a timeout to elapse at a given delta time relative to the current (raw) time */
extern SCH_TimeoutID SCH_AddTimeoutByDelay(double delay, SCH_TimeoutHandler, SCH_ArbitraryArgument);

/* This queues a timeout in a particular class, ensuring that the
   expiry time is at least a given separation away from any other
   timeout in the same class, given randomness is added to the delay
   and separation */
extern SCH_TimeoutID SCH_AddTimeoutInClass(double min_delay, double separation, double randomness,
                                           SCH_TimeoutClass class,
                                           SCH_TimeoutHandler handler, SCH_ArbitraryArgument);

/* The next one probably ought to return a status code */
extern void SCH_RemoveTimeout(SCH_TimeoutID);

extern void SCH_MainLoop(void);

extern void SCH_QuitProgram(void);

#endif /* GOT_SCHED_H */
