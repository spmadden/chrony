/*
  $Header: /cvs/src/chrony/client.c,v 1.68 2003/09/22 21:22:30 richard Exp $

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

  Command line client for configuring the daemon and obtaining status
  from it whilst running.
  */

#include "sysincl.h"

#include "candm.h"
#include "nameserv.h"
#include "md5.h"
#include "version.h"
#include "getdate.h"
#include "cmdparse.h"
#include "pktlength.h"
#include "memory.h"

#ifdef FEAT_READLINE
#include <readline/readline.h>
#include <readline/history.h>
#endif

/* ================================================== */

static int sock_fd;
struct sockaddr_in his_addr;

static int on_terminal = 0;

static int no_dns = 0;

/* ================================================== */
/* Forward prototypes */

static void process_cmd_manual_list(const char *line);
static void process_cmd_manual_delete(const char *line);

/* ================================================== */
/* Ought to extract some code from util.c to make
   a new set of utilities that can be linked into either
   the daemon or the client. */

static char *
time_to_log_form(time_t t)
{
  struct tm stm;
  static char buffer[64];
  static const char *months[] = {"Jan", "Feb", "Mar", "Apr",
                                 "May", "Jun", "Jul", "Aug",
                                 "Sep", "Oct", "Nov", "Dec"};


  stm = *gmtime(&t);
  snprintf(buffer, sizeof(buffer),
          "%2d%s%02d %02d:%02d:%02d",
          stm.tm_mday, months[stm.tm_mon], stm.tm_year % 100,
          stm.tm_hour, stm.tm_min, stm.tm_sec);

  return buffer;
}

/* ================================================== */

static char *
UTI_IPToDottedQuad(unsigned long ip)
{
  unsigned long a, b, c, d;
  static char result[64];
  a = (ip>>24) & 0xff;
  b = (ip>>16) & 0xff;
  c = (ip>> 8) & 0xff;
  d = (ip>> 0) & 0xff;
  snprintf(result, sizeof(result), "%ld.%ld.%ld.%ld", a, b, c, d);
  return result;
}

/* ================================================== */
/* Read a single line of commands from standard input.  Eventually we
   might want to use the GNU readline library. */

static char *
read_line(void)
{
  static char line[2048];
  static const char *prompt = "chronyc> ";

  if (on_terminal) {
#ifdef FEAT_READLINE
    char *cmd;

    /* save line only if not empty */
    cmd = readline(prompt);
    if( cmd == NULL ) return( NULL );
    
    /* user pressed return */
    if( *cmd != '\0' ) {
      strncpy(line, cmd, sizeof(line) - 1);
      line[sizeof(line) - 1] = '\0';
      add_history(cmd);
      /* free the buffer allocated by readline */
      free(cmd);
    } else {
      /* simulate the user has entered an empty line */
      *line = '\0';
    }
    return( line );
#else
    printf(prompt);
#endif
  }
  if (fgets(line, sizeof(line), stdin)) {
    return line;
  } else {
    return NULL;
  }
  
}

/* ================================================== */

static unsigned long
get_address(const char *hostname)
{
  unsigned char *address0;
  struct hostent *host;
  unsigned long result;

  /* Note, this call could block for a while */
  host = gethostbyname(hostname);
  if (host == NULL) {
    fprintf(stderr, "Could not get IP address for %s\n", hostname);
    exit(1);
  } else {
    address0 = host->h_addr_list[0];
    result = ((((unsigned long) address0[0]) << 24) |
              (((unsigned long) address0[1]) << 16) |
              (((unsigned long) address0[2]) <<  8) |
              (((unsigned long) address0[3])));
  }

  return result;

}

/* ================================================== */
/* Initialise the socket used to talk to the daemon */

static void
open_io(const char *hostname, int port)
{
  struct sockaddr_in my_addr;

  sock_fd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sock_fd < 0) {
    perror("Can't create socket");
    exit(1);
  }

  my_addr.sin_family = AF_INET;
  my_addr.sin_port = htons(INADDR_ANY);
  my_addr.sin_addr.s_addr = htonl(INADDR_ANY);

  if(bind(sock_fd, (struct sockaddr *) &my_addr, sizeof(my_addr)) < 0) {
    perror("Can't bind socket");
    exit(1);
  }

  /* Build the socket address structure for sending packets */
  his_addr.sin_family = AF_INET;
  his_addr.sin_addr.s_addr = htonl(get_address(hostname));

  /* Eventually the port number needs to be a command line param */
  his_addr.sin_port = htons(port);

  return;
}

/* ================================================== */

static void
close_io(void)
{

  close(sock_fd);

}

/* ================================================== */

static int
read_mask_address(char *line, unsigned long *mask, unsigned long *address)
{
  unsigned int ma, mb, mc, md, aa, ab, ac, ad;
  int ok = 0;
  char *p;

  p = line;
  while (*p && isspace((unsigned char)*p)) p++;
  if (!*p) {
    *mask = *address = 0;
    ok = 1;
  } else {

    if (sscanf(line, "%u.%u.%u.%u/%u.%u.%u.%u",
               &ma, &mb, &mc, &md,
               &aa, &ab, &ac, &ad) != 8) {
      fprintf(stderr, "Invalid syntax for mask/address\n");
      ok = 0;
    } else {
      *mask =    (ma << 24) | (mb << 16) | (mc << 8) | md;
      *address = (aa << 24) | (ab << 16) | (ac << 8) | ad;
      ok = 1;
    }
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_offline(CMD_Request *msg, char *line)
{
  unsigned long mask, address;
  int ok;

  if (read_mask_address(line, &mask, &address)) {
    msg->data.offline.mask = htonl(mask);
    msg->data.offline.address = htonl(address);
    msg->command = htons(REQ_OFFLINE);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */


static int
process_cmd_online(CMD_Request *msg, char *line)
{
  unsigned long mask, address;
  int ok;

  if (read_mask_address(line, &mask, &address)) {
    msg->data.online.mask = htonl(mask);
    msg->data.online.address = htonl(address);
    msg->command = htons(REQ_ONLINE);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static int
read_address_integer(char *line, unsigned long *address, int *value)
{
  char hostname[2048];
  int ok = 0;

  if (sscanf(line, "%2047s %d", hostname, value) != 2) {
    fprintf(stderr, "Invalid syntax for address value\n");
    ok = 0;
  } else {
    *address = DNS_Name2IPAddress(hostname);
    if (*address == DNS_Failed_Address) {
      fprintf(stderr, "Could not get address for hostname\n");
      ok = 0;
    } else {
      ok = 1;
    }
  }

  return ok;

}


/* ================================================== */

static int
read_address_double(char *line, unsigned long *address, double *value)
{
  char hostname[2048];
  int ok = 0;

  if (sscanf(line, "%2047s %lf", hostname, value) != 2) {
    fprintf(stderr, "Invalid syntax for address value\n");
    ok = 0;
  } else {
    *address = DNS_Name2IPAddress(hostname);
    if (*address == DNS_Failed_Address) {
      fprintf(stderr, "Could not get address for hostname\n");
      ok = 0;
    } else {
      ok = 1;
    }
  }

  return ok;

}


/* ================================================== */

static int
process_cmd_minpoll(CMD_Request *msg, char *line)
{
  unsigned long address;
  int minpoll;
  int ok;
  
  if (read_address_integer(line, &address, &minpoll)) {
    msg->data.modify_minpoll.address = htonl(address);
    msg->data.modify_minpoll.new_minpoll = htonl(minpoll);
    msg->command = htons(REQ_MODIFY_MINPOLL);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_maxpoll(CMD_Request *msg, char *line)
{
  unsigned long address;
  int maxpoll;
  int ok;
  
  if (read_address_integer(line, &address, &maxpoll)) {
    msg->data.modify_maxpoll.address = htonl(address);
    msg->data.modify_maxpoll.new_maxpoll = htonl(maxpoll);
    msg->command = htons(REQ_MODIFY_MAXPOLL);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_maxdelay(CMD_Request *msg, char *line)
{
  unsigned long address;
  double max_delay;
  int ok;
  
  if (read_address_double(line, &address, &max_delay)) {
    msg->data.modify_maxdelay.address = htonl(address);
    msg->data.modify_maxdelay.new_max_delay = REAL2WIRE(max_delay);
    msg->command = htons(REQ_MODIFY_MAXDELAY);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_maxdelayratio(CMD_Request *msg, char *line)
{
  unsigned long address;
  double max_delay_ratio;
  int ok;
  
  if (read_address_double(line, &address, &max_delay_ratio)) {
    msg->data.modify_maxdelayratio.address = htonl(address);
    msg->data.modify_maxdelayratio.new_max_delay_ratio = REAL2WIRE(max_delay_ratio);
    msg->command = htons(REQ_MODIFY_MAXDELAYRATIO);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_maxupdateskew(CMD_Request *msg, char *line)
{
  int ok;
  double new_max_update_skew;
  
  if (sscanf(line, "%lf", &new_max_update_skew) == 1) {
    msg->data.modify_maxupdateskew.new_max_update_skew = REAL2WIRE(new_max_update_skew);
    msg->command = htons(REQ_MODIFY_MAXUPDATESKEW);
    ok = 1;
  } else {
    ok = 0;
  }

  return ok;

}

/* ================================================== */

static void
process_cmd_dump(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_DUMP);
}

/* ================================================== */

static void
process_cmd_writertc(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_WRITERTC);
}

/* ================================================== */

static void
process_cmd_trimrtc(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_TRIMRTC);
}

/* ================================================== */

static void
process_cmd_cyclelogs(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_CYCLELOGS);
}

/* ================================================== */

static int
process_cmd_burst(CMD_Request *msg, char *line)
{
  int ok;
  int n_good_samples, n_total_samples;
  unsigned int ma, mb, mc, md, aa, ab, ac, ad;
  int n_parsed;

  n_parsed = sscanf(line, "%d/%d %u.%u.%u.%u/%u.%u.%u.%u",
                    &n_good_samples,
                    &n_total_samples,
                    &ma, &mb, &mc, &md,
                    &aa, &ab, &ac, &ad);

  msg->command = htons(REQ_BURST);
  msg->data.burst.n_good_samples = ntohl(n_good_samples);
  msg->data.burst.n_total_samples = ntohl(n_total_samples);

  if (n_parsed == 10) {
    msg->data.burst.mask = htonl((ma << 24) | (mb << 16) | (mc << 8) | md);
    msg->data.burst.address = htonl((aa << 24) | (ab << 16) | (ac << 8) | ad);
    ok = 1;
  } else if (n_parsed == 2) {
    msg->data.burst.mask = 0;
    msg->data.burst.address = 0;
    ok = 1;
  } else {
    ok = 0;
    fprintf(stderr, "Invalid syntax for burst command\n");
  }

  return ok;

}

/* ================================================== */

static int
process_cmd_local(CMD_Request *msg, const char *line)
{
  const char *p;
  int stratum;

  p = line;
  while (*p && isspace((unsigned char)*p)) p++;
  
  if (!*p) {
    return 0;
  } else if (!strncmp(p, "off", 3)) {
    msg->data.local.on_off = htonl(0);
  } else if (sscanf(p, "stratum%d", &stratum) == 1) {
    msg->data.local.on_off = htonl(1);
    msg->data.local.stratum = htonl(stratum);
  } else {
    fprintf(stderr, "Invalid syntax for local command\n");
    return 0;
  }

  msg->command = htons(REQ_LOCAL);
  return 1;
}

/* ================================================== */

static int
process_cmd_manual(CMD_Request *msg, const char *line)
{
  const char *p;

  p = line;
  while (*p && isspace((unsigned char)*p)) p++;

  if (!*p) {
    return 0;
  } else if (!strncmp(p, "off", 3)) {
    msg->data.manual.option = htonl(0);
  } else if (!strncmp(p, "on", 2)) {
    msg->data.manual.option = htonl(1);
  } else if (!strncmp(p, "reset", 5)) {
    msg->data.manual.option = htonl(2);
  } else if (!strncmp(p, "list", 4)) {
    process_cmd_manual_list(p);
    return 0;
  } else if (!strncmp(p, "delete", 6)) {
    process_cmd_manual_delete(p+6);
    return 0;
  } else {
    return 0;
  }
  msg->command = htons(REQ_MANUAL);

  return 1;
}

/* ================================================== */

static int
parse_allow_deny(CMD_Request *msg, char *line)
{
  unsigned long a, b, c, d, n, ip;
  char *p, *q;
  
  p = line;
  while (*p && isspace((unsigned char)*p)) p++;
  if (!*p) {
    /* blank line - applies to all addresses */
    msg->data.allow_deny.ip = htonl(0);
    msg->data.allow_deny.subnet_bits = htonl(0);
  } else {
    char *slashpos;
    slashpos = strchr(p, '/');
    if (slashpos) *slashpos = 0;
    
    n = sscanf(p, "%lu.%lu.%lu.%lu", &a, &b, &c, &d);

    if (n == 0) {
      /* Try to parse as the name of a machine */
      q = p;
      while (*q) {
        if (*q == '\n') *q = 0;
        q++;
      }
      ip = DNS_Name2IPAddress(p);
      if (ip == DNS_Failed_Address) {
        fprintf(stderr, "Could not read address\n");
        return 0;
      } else {
        msg->data.allow_deny.ip = htonl(ip);
        msg->data.allow_deny.subnet_bits = htonl(32);
      }        
    } else {
      
      a &= 0xff;
      b &= 0xff;
      c &= 0xff;
      d &= 0xff;
      
      switch (n) {
        case 1:
          msg->data.allow_deny.ip = htonl((a<<24));
          msg->data.allow_deny.subnet_bits = htonl(8);
          break;
        case 2:
          msg->data.allow_deny.ip = htonl((a<<24) | (b<<16));
          msg->data.allow_deny.subnet_bits = htonl(16);
          break;
        case 3:
          msg->data.allow_deny.ip = htonl((a<<24) | (b<<16) | (c<<8));
          msg->data.allow_deny.subnet_bits = htonl(24);
          break;
        case 4:
          msg->data.allow_deny.ip = htonl((a<<24) | (b<<16) | (c<<8) | d);
          msg->data.allow_deny.subnet_bits = htonl(32);
          break;
        default:
          assert(0);
          
      }

      if (slashpos) {
        int specified_subnet_bits, n;
        n = sscanf(slashpos+1, "%d", &specified_subnet_bits);
        if (n == 1) {
          msg->data.allow_deny.subnet_bits = htonl(specified_subnet_bits);
        } else {
          fprintf(stderr, "Warning: badly formatted subnet size, using %ld\n", (long) ntohl(msg->data.allow_deny.subnet_bits));
        }
      } 
    }
  }
  return 1;
}

/* ================================================== */

static int
process_cmd_allow(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_ALLOW);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_allowall(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_ALLOWALL);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_deny(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_DENY);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_denyall(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_DENYALL);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_cmdallow(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_CMDALLOW);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_cmdallowall(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_CMDALLOWALL);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_cmddeny(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_CMDDENY);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
process_cmd_cmddenyall(CMD_Request *msg, char *line)
{
  int status;
  msg->command = htons(REQ_CMDDENYALL);
  status = parse_allow_deny(msg, line);
  return status;
}

/* ================================================== */

static int
accheck_getaddr(char *line, unsigned long *addr)
{
  unsigned long a, b, c, d, ip;
  unsigned char *p, *q;
  p = line;
  while (*p && isspace(*p)) p++;
  if (!*p) {
    return 0;
  } else {
    if (sscanf(p, "%lu.%lu.%lu.%lu", &a, &b, &c, &d) == 4) {
      *addr = (a<<24) | (b<<16) | (c<<8) | d;
      return 1;
    } else {
      q = p;
      while (*q) {
        if (*q == '\n') *q = 0;
        q++;
      }
      ip = DNS_Name2IPAddress(p);
      if (ip == DNS_Failed_Address) {
        return 0;
      } else {
        *addr = ip;
        return 1;
      }
    }
  }
}

/* ================================================== */

static int
process_cmd_accheck(CMD_Request *msg, char *line)
{
  unsigned long ip;
  msg->command = htons(REQ_ACCHECK);
  if (accheck_getaddr(line, &ip)) {
    msg->data.ac_check.ip = htonl(ip);
    return 1;
  } else {    
    fprintf(stderr, "Could not read address\n");
    return 0;
  }
}

/* ================================================== */

static int
process_cmd_cmdaccheck(CMD_Request *msg, char *line)
{
  unsigned long ip;
  msg->command = htons(REQ_CMDACCHECK);
  if (accheck_getaddr(line, &ip)) {
    msg->data.ac_check.ip = htonl(ip);
    return 1;
  } else {    
    fprintf(stderr, "Could not read address\n");
    return 0;
  }
}

/* ================================================== */

static void
process_cmd_dfreq(CMD_Request *msg, char *line)
{
  double dfreq;
  msg->command = htons(REQ_DFREQ);
  if (sscanf(line, "%lf", &dfreq) == 1) {
    msg->data.dfreq.dfreq = REAL2WIRE(dfreq);
  } else {
    msg->data.dfreq.dfreq = REAL2WIRE(0.0);
  }
}

/* ================================================== */

static void
cvt_to_sec_usec(double x, long *sec, long *usec) {
  long s, us;
  s = (long) x;
  us = (long)(0.5 + 1.0e6 * (x - (double) s));
  while (us >= 1000000) {
    us -= 1000000;
    s += 1;
  }
  while (us < 0) {
    us += 1000000;
    s -= 1;
  }
  
  *sec = s;
  *usec = us;
  return;
}

/* ================================================== */

static void
process_cmd_doffset(CMD_Request *msg, char *line)
{
  double doffset;
  long sec, usec;
  msg->command = htons(REQ_DOFFSET);
  if (sscanf(line, "%lf", &doffset) == 1) {
    cvt_to_sec_usec(doffset, &sec, &usec);
    msg->data.doffset.sec = htonl(sec);
    msg->data.doffset.usec = htonl(usec);
  } else {
    msg->data.doffset.sec = htonl(0);
    msg->data.doffset.usec = htonl(0);
  }
}

/* ================================================== */

static int
process_cmd_add_server_or_peer(CMD_Request *msg, char *line)
{
  CPS_NTP_Source data;
  CPS_Status status;
  int result = 0;
  
  status = CPS_ParseNTPSourceAdd(line, &data);
  switch (status) {
    case CPS_Success:
      msg->data.ntp_source.port = htonl((unsigned long) data.port);
      msg->data.ntp_source.ip_addr = htonl(data.ip_addr);
      msg->data.ntp_source.minpoll = htonl(data.params.minpoll);
      msg->data.ntp_source.maxpoll = htonl(data.params.maxpoll);
      msg->data.ntp_source.presend_minpoll = htonl(data.params.presend_minpoll);
      msg->data.ntp_source.online = htonl(data.params.online);
      msg->data.ntp_source.auto_offline = htonl(data.params.auto_offline);
      msg->data.ntp_source.authkey = htonl(data.params.authkey);
      msg->data.ntp_source.max_delay = REAL2WIRE(data.params.max_delay);
      msg->data.ntp_source.max_delay_ratio = REAL2WIRE(data.params.max_delay_ratio);
      result = 1;

      break;
    case CPS_BadOption:
      fprintf(stderr, "Unrecognized subcommand\n");
      break;
    case CPS_BadHost:
      fprintf(stderr, "Invalid host/IP address\n");
      break;
    case CPS_BadPort:
      fprintf(stderr, "Unreadable port number\n");
      break;
    case CPS_BadMinpoll:
      fprintf(stderr, "Unreadable minpoll value\n");
      break;
    case CPS_BadMaxpoll:
      fprintf(stderr, "Unreadable maxpoll value\n");
      break;
    case CPS_BadPresend:
      fprintf(stderr, "Unreadable presend value\n");
      break;
    case CPS_BadMaxdelayratio:
      fprintf(stderr, "Unreadable max delay ratio value\n");
      break;
    case CPS_BadMaxdelay:
      fprintf(stderr, "Unreadable max delay value\n");
      break;
    case CPS_BadKey:
      fprintf(stderr, "Unreadable key value\n");
      break;
  }

  return result;
}

/* ================================================== */

static int
process_cmd_add_server(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_ADD_SERVER);
  return process_cmd_add_server_or_peer(msg, line);
}

/* ================================================== */

static int
process_cmd_add_peer(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_ADD_PEER);
  return process_cmd_add_server_or_peer(msg, line);
}

/* ================================================== */

static int
process_cmd_delete(CMD_Request *msg, char *line)
{
  char hostname[2048];
  int ok = 0;
  unsigned long address = 0UL;

  msg->command = htons(REQ_DEL_SOURCE);

  if (sscanf(line, "%2047s", hostname) != 1) {
    fprintf(stderr, "Invalid syntax for address\n");
    ok = 0;
  } else {
    address = DNS_Name2IPAddress(hostname);
    if (address == DNS_Failed_Address) {
      fprintf(stderr, "Could not get address for hostname\n");
      ok = 0;
    } else {
      ok = 1;
    }
  }

  msg->data.del_source.ip_addr = htonl(address);

  return ok;
  
}

/* ================================================== */

static int password_seen = 0;
static MD5_CTX md5_after_just_password;

/* ================================================== */

static int
process_cmd_password(CMD_Request *msg, char *line)
{
  char *p, *q;
  char *password;
  struct timezone tz;

  p = line;
  while (*p && isspace((unsigned char)*p))
    p++;

  /* Get rid of trailing newline */
  for (q=p; *q; q++) {
    if (isspace((unsigned char)*q)) *q = 0;
  }

  if (*p) {
    password = p;
  } else {
    /* blank line, prompt for password */
    password = getpass("Password: ");
  }

  if (!*password) {
    password_seen = 0;
  } else {
    password_seen = 1;
  }

  /* Generate MD5 initial context */
  MD5Init(&md5_after_just_password);
  MD5Update(&md5_after_just_password, (unsigned char *) password, strlen(password));
  
  /* Blank the password for security */
  for (p = password; *p; p++) {
    *p = 0;
  }
    
  if (gettimeofday(&msg->data.logon.ts, &tz) < 0) {
    printf("500 - Could not read time of day\n");
    return 0;
  } else {
    msg->command = htons(REQ_LOGON); /* Just force a round trip so that we get tokens etc */
    msg->data.logon.ts.tv_sec = htonl(msg->data.logon.ts.tv_sec);
    msg->data.logon.ts.tv_usec = htonl(msg->data.logon.ts.tv_usec);
    return 1;
  }
}

/* ================================================== */

static void
generate_auth(CMD_Request *msg)
{
  MD5_CTX ctx;
  int pkt_len;

  pkt_len = PKL_CommandLength(msg);
  ctx = md5_after_just_password;
  MD5Update(&ctx, (unsigned char *) msg, offsetof(CMD_Request, auth));
  if (pkt_len > offsetof(CMD_Request, data)) {
    MD5Update(&ctx, (unsigned char *) &(msg->data), pkt_len - offsetof(CMD_Request, data));
  }
  MD5Final(&ctx);
  memcpy(&(msg->auth), &ctx.digest, 16);
}

/* ================================================== */

static int
check_reply_auth(CMD_Reply *msg)
{
  int pkt_len;
  MD5_CTX ctx;

  pkt_len = PKL_ReplyLength(msg);
  ctx = md5_after_just_password;
  MD5Update(&ctx, (unsigned char *) msg, offsetof(CMD_Request, auth));
  if (pkt_len > offsetof(CMD_Reply, data)) {
    MD5Update(&ctx, (unsigned char *) &(msg->data), pkt_len - offsetof(CMD_Reply, data));
  }
  MD5Final(&ctx);

  if (!memcmp((void *) &ctx.digest, (void *) &(msg->auth), 16)) {
    return 1;
  } else {
    return 0;
  }
}

/* ================================================== */

static void
give_help(void)
{
  printf("205 - Help follows\n");
  printf("accheck <address> : Check whether NTP access is allowed to <address>\n");
  printf("activity : Check how many NTP sources are online/offline\n");
  printf("allow [<subnet-addr>] : Allow NTP access to that subnet as a default\n");
  printf("allow all [<subnet-addr>] : Allow NTP access to that subnet and all children\n");
  printf("burst <n-good>/<n-max> [<mask>/<masked-address>] : Start a rapid set of measurements\n");
  printf("clients : Report on clients that have accessed the server\n");
  printf("cmdaccheck <address> : Check whether command access is allowed to <address>\n");
  printf("cmdallow [<subnet-addr>] : Allow command access to that subnet as a default\n");
  printf("cmdallow all [<subnet-addr>] : Allow command access to that subnet and all children\n");
  printf("cmddeny [<subnet-addr>] : Deny command access to that subnet as a default\n");
  printf("cmddeny all [<subnet-addr>] : Deny command access to that subnet and all children\n");
  printf("cyclelogs : Close and re-open logs files\n");
  printf("deny [<subnet-addr>] : Deny NTP access to that subnet as a default\n");
  printf("deny all [<subnet-addr>] : Deny NTP access to that subnet and all children\n");
  printf("dump : Dump all measurements to save files\n");
  printf("exit : Leave the program\n");
  printf("help : Generate this help\n");
  printf("local off : Disable server capability for unsynchronised clock\n");
  printf("local stratum <stratum> : Enable server capability for unsynchronised clock\n");
  printf("makestep : Jump the time to remove any correction being slewed\n");
  printf("manual off|on|reset : Disable/enable/reset settime command and statistics\n");
  printf("manual list : Show previous settime entries\n");
  printf("minpoll <address> <new-minpoll> : Modify minimum polling interval of source\n");
  printf("maxdelay <address> <new-max-delay> : Modify maximum round-trip valid sample delay for source\n");
  printf("maxdelayratio <address> <new-max-ratio> : Modify max round-trip delay ratio for source\n");
  printf("maxpoll <address> <new-minpoll> : Modify maximum polling interval of source\n");
  printf("maxupdateskew <new-max-skew> : Modify maximum skew for a clock frequency update to be made\n");
  printf("offline [<mask>/<masked-address>] : Set sources in subnet to offline status\n");
  printf("online [<mask>/<masked-address>] : Set sources in subnet to online status\n");
  printf("password [<new-password>] : Set command authentication password\n");
  printf("quit : Leave the program\n");
  printf("rtcdata : Print current RTC performance parameters\n");
  printf("settime <date/time (e.g. Nov 21, 1997 16:30:05 or 16:30:05)> : Manually set the daemon time\n");
  printf("sources [-v] : Display information about current sources\n");
  printf("sourcestats [-v] : Display estimation information about current sources\n");
  printf("tracking : Display system time information\n");
  printf("trimrtc : Correct RTC relative to system clock\n");
  printf("writertc : Save RTC parameters to file\n");
  printf(".\n");
}

/* ================================================== */

static unsigned long sequence = 0;
static unsigned long utoken = 0;
static unsigned long token = 0;

#define MAX_ATTEMPTS 5


/* This is the core protocol module.  Complete particular fields in
   the outgoing packet, send it, wait for a response, handle retries,
   etc.  Returns a Boolean indicating whether the protocol was
   successful or not.*/

static int
submit_request(CMD_Request *request, CMD_Reply *reply, int *reply_auth_ok)
{
  unsigned long tx_sequence;
  int where_from_len;
  struct sockaddr_in where_from;
  int bad_length, bad_sender, bad_sequence, bad_header;
  int select_status;
  int recvfrom_status;
  int read_length;
  int expected_length;
  int command_length;
  struct timeval timeout;
  int timeout_seconds;
  int n_attempts;
  fd_set rdfd, wrfd, exfd;

  request->version = PROTO_VERSION_NUMBER;
  request->pkt_type = PKT_TYPE_CMD_REQUEST;
  request->res1 = 0;
  request->res2 = 0;
  tx_sequence = sequence++;
  request->sequence = htonl(tx_sequence);
  request->attempt = 0;
  request->utoken = htonl(utoken);
  request->token = htonl(token);


  timeout_seconds = 120;

  n_attempts = 0;

  do {

    /* Decide whether to authenticate */
    if (password_seen) {
      if (!utoken || (request->command == htons(REQ_LOGON))) {
        /* Otherwise, the daemon won't bother authenticating our
           packet and we won't get a token back */
        request->utoken = htonl(SPECIAL_UTOKEN);
      }
      generate_auth(request);
    }

    command_length = PKL_CommandLength(request);
#if 0
    printf("Sent command length=%d bytes\n", command_length);
#endif

    if (sendto(sock_fd, (void *) request, command_length, 0,
               (struct sockaddr *) &his_addr, sizeof(his_addr)) < 0) {


#if 0
      perror("Could not send packet");
#endif
      return 0;
    }

    /* Increment this for next time */
    ++ request->attempt;
      
    timeout.tv_sec = timeout_seconds;
    timeout.tv_usec = 0;

    timeout_seconds += 1;
    FD_ZERO(&rdfd);
    FD_ZERO(&wrfd);
    FD_ZERO(&exfd);

    FD_SET(sock_fd, &rdfd);

    select_status = select(sock_fd + 1, &rdfd, &wrfd, &exfd, &timeout);

    if (select_status < 0) {
#if 0
      perror("Select returned negative status");
#endif
    } else if (select_status == 0) {
      /* Timeout must have elapsed, try a resend? */
      n_attempts ++;
      if (n_attempts == MAX_ATTEMPTS) {
        return 0;
      }

      /* Back to top of loop to do resend */
      continue;
      
    } else {
      
      where_from_len = sizeof(where_from);
      recvfrom_status = recvfrom(sock_fd, (void *) reply, sizeof(CMD_Reply), 0,
                                 (struct sockaddr *) &where_from, &where_from_len);
      

#if 0
      printf("Received packet, status=%d\n", recvfrom_status);
#endif

      if (recvfrom_status < 0) {
        /* If we get connrefused here, it suggests the sendto is
           going to a dead port - but only if the daemon machine is
           running Linux (Solaris doesn't return anything) */
        n_attempts++;
        if (n_attempts == MAX_ATTEMPTS) {
          return 0;
        }
      } else {
        
        read_length = recvfrom_status;
        expected_length = PKL_ReplyLength(reply);

        bad_length = (read_length != expected_length);
        bad_sender = ((where_from.sin_addr.s_addr != his_addr.sin_addr.s_addr) ||
                      (where_from.sin_port != his_addr.sin_port));
        
        if (!bad_length) {
          bad_sequence = (ntohl(reply->sequence) != tx_sequence);
        } else {
          bad_sequence = 0;
        }
        
        if (bad_length || bad_sender || bad_sequence) {
          n_attempts++;
          if (n_attempts == MAX_ATTEMPTS) {
            return 0;
          }
          continue;
        }
        
        bad_header = ((reply->version != PROTO_VERSION_NUMBER) ||
                      (reply->pkt_type != PKT_TYPE_CMD_REPLY) ||
                      (reply->res1 != 0) ||
                      (reply->res2 != 0));
        
        if (bad_header) {
          n_attempts++;
          if (n_attempts == MAX_ATTEMPTS) {
            return 0;
          }
          continue;
        }
        
        /* Good packet received, print out results */
#if 0
        printf("Reply cmd=%d reply=%d stat=%d num=%d tot=%d seq=%d utok=%08lx tok=%d\n",
               ntohs(reply->command), ntohs(reply->reply),
               ntohs(reply->status), ntohs(reply->number),
               ntohs(reply->total),
               ntohl(reply->sequence),
               ntohl(reply->utoken),
               ntohl(reply->token));
#endif

        if (password_seen) {
          *reply_auth_ok = check_reply_auth(reply);
        } else {
          /* Assume in this case that the reply is always considered
             to be authentic */
          *reply_auth_ok = 1;
        }
            
        utoken = ntohl(reply->utoken);

        if (*reply_auth_ok) {
          /* If we're in authenticated mode, only acquire the utoken
             and new token values if the reply authenticated properly.
             This protects against forged packets with bogus tokens
             in.  We won't accept a repeat of an old message with a
             stale token in it, due to bad_sequence processing
             earlier. */
          utoken = ntohl(reply->utoken);
          token = ntohl(reply->token);
        }
        
        break;

      }
    }
  } while (1);

  return 1;
}

/* ================================================== */

static void
print_seconds(unsigned long s)
{
  unsigned long d;
  if (s <= 1024) {
    printf("%4ld", s);
  } else if (s < 36000) {
    printf("%3ldm", s / 60);
  } else if (s < 345600) {
    printf("%3ldh", s / 3600);
  } else {
    d = s / 86400;
    if (d > 999) {
      printf("%3ldy", d / 365);
    } else {
      printf("%3ldd", d);
    }
  }
}

/* ================================================== */

static void
print_microseconds(unsigned long us)
{
  if (us <= 9999) {
    printf("%4ldus", us);
  } else if (us <= 9999999) {
    printf("%4ldms", us / 1000);
  } else if (us <= 999999999) {
    printf("%3ld.%01lds", us / 1000000, (us/100000) % 10);
  } else {
    printf("%5lds", us / 1000000);
  }
}

/* ================================================== */

static void
print_signed_microseconds(long us)
{
  long x = abs(us);
  if (x <= 9999) {
    printf("%+5ldus", us);
  } else if (x <= 9999999) {
    printf("%+5ldms", us / 1000);
  } else {
    printf("%+6lds", us / 1000000);
  }
}

/* ================================================== */

static int
check_for_verbose_flag(char *line)
{
  char *p = line;
  while (*p && isspace((unsigned char)*p)) p++;
  if (!strncmp(p, "-v", 2)) {
    return 1;
  } else {
    return 0;
  }
}

/* ================================================== */

static void
process_cmd_sources(char *line)
{
  int submit_ok;
  int auth_ok;
  CMD_Request request;
  CMD_Reply reply;
  int n_sources, i;
  int verbose = 0;

  int32_t orig_latest_meas, latest_meas, est_offset; /* Was long JGH */
  unsigned long ip_addr;
  uint32_t latest_meas_err, est_offset_err; /* Was unsigned long JGH */
  uint32_t latest_meas_ago;  /* Was unsigned long JGH */
  unsigned short poll, stratum;
  unsigned short state, mode;
  double resid_freq, resid_skew;
  const char *dns_lookup;
  char hostname_buf[32];
  unsigned short status;

  /* Check whether to output verbose headers */
  verbose = check_for_verbose_flag(line);
  
  request.command = htons(REQ_N_SOURCES);
  submit_ok = submit_request(&request, &reply, &auth_ok);

  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_INVALID:
        printf("502 Invalid command\n");
        return;
        break;
      case STT_NOHOSTACCESS:
        printf("510 No command access from this host\n");
        return;
        break;
      default:
        break;
    }

    n_sources = ntohl(reply.data.n_sources.n_sources);
    printf("210 Number of sources = %d\n", n_sources);
    if (verbose) {
      printf("\n");
      printf("  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.\n");
      printf(" / .- Source state '*' = current synced, '+' = OK for sync, '?' = unreachable,\n");
      printf("| /                'x' = time may be in error, '~' = time is too variable.\n");
      printf("||                                                 .- xxxx [ yyyy ] +/- zzzz\n");
      printf("||                                                /   xxxx = adjusted offset,\n");
      printf("||         Log2(Polling interval) -.             |    yyyy = measured offset,\n");
      printf("||                                  \\            |    zzzz = estimated error.\n");
      printf("||                                   |           |                         \n");
    }

    printf("MS Name/IP address           Stratum Poll LastRx Last sample\n");
    printf("============================================================================\n");

    /*     "MS NNNNNNNNNNNNNNNNNNNNNNNNN    SS    PP   RRRR  SSSSSSS[SSSSSSS] +/- SSSSSS" */

    for (i=0; i<n_sources; i++) {
      request.command = htons(REQ_SOURCE_DATA);
      request.data.source_data.index = htonl(i);
      submit_ok = submit_request(&request, &reply, &auth_ok);

      if (submit_ok) {
        if (ntohs(reply.status) == STT_SUCCESS) {
          ip_addr = ntohl(reply.data.source_data.ip_addr);
          poll = ntohs(reply.data.source_data.poll);
          stratum = ntohs(reply.data.source_data.stratum);
          state = ntohs(reply.data.source_data.state);
          mode = ntohs(reply.data.source_data.mode);
          latest_meas_ago = ntohl(reply.data.source_data.since_sample);
          orig_latest_meas = ntohl(reply.data.source_data.orig_latest_meas);
          latest_meas = ntohl(reply.data.source_data.latest_meas);
          latest_meas_err = ntohl(reply.data.source_data.latest_meas_err);
          est_offset = ntohl(reply.data.source_data.est_offset);
          est_offset_err = ntohl(reply.data.source_data.est_offset_err);
          resid_freq = (double) ((long) ntohl(reply.data.source_data.resid_freq)) * 1.0e-3;
          resid_skew = (double) (ntohl(reply.data.source_data.resid_skew)) * 1.0e-3;

          hostname_buf[25] = 0;
          if (no_dns) {
            snprintf(hostname_buf, sizeof(hostname_buf), "%s", UTI_IPToDottedQuad(ip_addr));
          } else {
            dns_lookup = DNS_IPAddress2Name(ip_addr);
            strncpy(hostname_buf, dns_lookup, 25);
          }

          switch (mode) {
            case RPY_SD_MD_CLIENT:
              printf("^"); break;
            case RPY_SD_MD_PEER:
              printf("="); break;
            case RPY_SD_MD_REF:
              printf("#"); break;
          }
          switch (state) {
            case RPY_SD_ST_SYNC:
              printf("*"); break;
            case RPY_SD_ST_UNREACH:
              printf("?"); break;
            case RPY_SD_ST_FALSETICKER:
              printf("x"); break;
            case RPY_SD_ST_JITTERY:
              printf("~"); break;
            case RPY_SD_ST_OTHER:
              printf("+"); break;
          }

          printf(" %-25s    %2d   %2d   ", hostname_buf, stratum, poll);
          print_seconds((unsigned long)latest_meas_ago); /* Added cast JGH */
          printf("  ");
          print_signed_microseconds((long)latest_meas); /* Added cast JGH */
          printf("[");
          print_signed_microseconds((long)orig_latest_meas); /* Added cast JGH */
          printf("]");
          printf(" +/- ");
          print_microseconds((unsigned long)latest_meas_err); /* Added cast JGH */
          printf("\n");
        }
      }
    }
  } else {
    printf("506 Cannot talk to daemon\n");
  }

}

/* ================================================== */

static void
process_cmd_sourcestats(char *line)
{
  int submit_ok;
  int auth_ok;
  CMD_Request request;
  CMD_Reply reply;
  int n_sources, i;
  int verbose = 0;

  const char *dns_lookup;
  char hostname_buf[32];
  unsigned long n_samples, n_runs, span_seconds;
  double resid_freq_ppm, skew_ppm;
  unsigned long sd_us;
  unsigned long ip_addr;
  unsigned short status;

  verbose = check_for_verbose_flag(line);

  request.command = htons(REQ_N_SOURCES);
  submit_ok = submit_request(&request, &reply, &auth_ok);

  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_INVALID:
        printf("502 Invalid command\n");
        return;
        break;
      case STT_NOHOSTACCESS:
        printf("510 No command access from this host\n");
        return;
        break;
      default:
        break;
    }

    n_sources = ntohl(reply.data.n_sources.n_sources);
    printf("210 Number of sources = %d\n", n_sources);
    if (verbose) {
      printf("                             .- Number of sample points in measurement set.\n");
      printf("                            /    .- Number of residual runs with same sign.\n");
      printf("                           |    /    .- Length of measurement set (time).\n");
      printf("                           |   |    /      .- Est. clock freq error (ppm).\n");
      printf("                           |   |   |      /            .- Est error in freq.\n");
      printf("                           |   |   |     |            /            .- On the\n");
      printf("                           |   |   |     |           |            /   samples.\n");
      printf("                           |   |   |     |           |           |\n");
    }

    printf("Name/IP Address            NP  NR  Span  Frequency   Freq Skew   Std Dev\n");
    printf("========================================================================\n");

    /*      NNNNNNNNNNNNNNNNNNNNNNNNN  NP  NR  SSSS  FFFFFFFFFF  SSSSSSSSSS  SSSSSSS */

    for (i=0; i<n_sources; i++) {
      request.command = htons(REQ_SOURCESTATS);
      request.data.source_data.index = htonl(i);
      submit_ok = submit_request(&request, &reply, &auth_ok);

      if (submit_ok) {
        if (ntohs(reply.status) == STT_SUCCESS) {
          
          ip_addr = ntohl(reply.data.sourcestats.ip_addr);
          n_samples = ntohl(reply.data.sourcestats.n_samples);
          n_runs = ntohl(reply.data.sourcestats.n_runs);
          span_seconds = ntohl(reply.data.sourcestats.span_seconds);
          resid_freq_ppm = WIRE2REAL(reply.data.sourcestats.resid_freq_ppm);
          skew_ppm = WIRE2REAL(reply.data.sourcestats.skew_ppm);
          sd_us = ntohl(reply.data.sourcestats.sd_us);

          hostname_buf[25] = 0;
          if (no_dns) {
            snprintf(hostname_buf, sizeof(hostname_buf), "%s", UTI_IPToDottedQuad(ip_addr));
          } else {
            dns_lookup = DNS_IPAddress2Name(ip_addr);
            strncpy(hostname_buf, dns_lookup, 25);
          }

          printf("%-25s  %2lu  %2lu  ", hostname_buf, n_samples, n_runs);
          print_seconds(span_seconds);
          printf("  %10.3f  %10.3f  ", resid_freq_ppm, skew_ppm);
          print_microseconds(sd_us);
          printf("\n");
        }
      }
    }
  } else {
    printf("506 Cannot talk to daemon\n");
  }

}

/* ================================================== */

static void
process_cmd_tracking(char *line)
{
  int status;
  int submit_ok;
  int auth_ok;
  CMD_Request request;
  CMD_Reply reply;
  unsigned long ref_id;
  struct timeval ref_time;
  struct tm ref_time_tm;
  unsigned long a, b, c, d;
  struct timeval correction_tv;
  double correction;
  double freq_ppm;
  double resid_freq_ppm;
  double skew_ppm;
  double root_delay;
  double root_dispersion;
  
  request.command = htons(REQ_TRACKING);
  submit_ok = submit_request(&request, &reply, &auth_ok);

  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_INVALID:
        printf("502 Invalid command\n");
        return;
        break;
      case STT_NOHOSTACCESS:
        printf("510 No command access from this host\n");
        return;
        break;
      default:
        break;
    }

    ref_id = ntohl(reply.data.tracking.ref_id);
    a = (ref_id >> 24);
    b = (ref_id >> 16) & 0xff;
    c = (ref_id >> 8) & 0xff;
    d = (ref_id) & 0xff;
    printf("Reference ID    : %lu.%lu.%lu.%lu (%s)\n",
           a, b, c, d,
           (no_dns) ? UTI_IPToDottedQuad(ref_id) : DNS_IPAddress2Name(ref_id));
    printf("Stratum         : %lu\n", (unsigned long) ntohl(reply.data.tracking.stratum));
    ref_time.tv_sec = ntohl(reply.data.tracking.ref_time_s);
    ref_time.tv_usec = ntohl(reply.data.tracking.ref_time_us);
    ref_time_tm = *gmtime((time_t *)&ref_time.tv_sec);
    printf("Ref time (UTC)  : %s", asctime(&ref_time_tm));
    correction_tv.tv_sec = ntohl(reply.data.tracking.current_correction_s);
    correction_tv.tv_usec = ntohl(reply.data.tracking.current_correction_us);
    correction = (double) correction_tv.tv_sec + 1.0e-6 * correction_tv.tv_usec;
    printf("System time     : %.6f seconds %s of NTP time\n", fabs(correction),
           (correction > 0.0) ? "slow" : "fast");
    freq_ppm = WIRE2REAL(reply.data.tracking.freq_ppm);
    resid_freq_ppm = WIRE2REAL(reply.data.tracking.resid_freq_ppm);
    skew_ppm = WIRE2REAL(reply.data.tracking.skew_ppm);
    root_delay = WIRE2REAL(reply.data.tracking.root_delay);
    root_dispersion = WIRE2REAL(reply.data.tracking.root_dispersion);
    printf("Frequency       : %.3f ppm %s\n", fabs(freq_ppm), (freq_ppm < 0.0) ? "slow" : "fast"); 
    printf("Residual freq   : %.3f ppm\n", resid_freq_ppm);
    printf("Skew            : %.3f ppm\n", skew_ppm);
    printf("Root delay      : %.6f seconds\n", root_delay);
    printf("Root dispersion : %.6f seconds\n", root_dispersion);
  } else {
    printf("506 Cannot talk to daemon\n");
  }
}
/* ================================================== */

static void
process_cmd_rtcreport(char *line)
{
  int status;
  int submit_ok;
  int auth_ok;
  CMD_Request request;
  CMD_Reply reply;
  time_t ref_time;
  struct tm ref_time_tm;
  unsigned short n_samples;
  unsigned short n_runs;
  unsigned long span_seconds;
  double coef_seconds_fast;
  double coef_gain_rate_ppm;
  
  request.command = htons(REQ_RTCREPORT);
  submit_ok = submit_request(&request, &reply, &auth_ok);

  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_INVALID:
        printf("502 Invalid command\n");
        return;
        break;
      case STT_NORTC:
        printf("513 No RTC driver\n");
        return;
        break;
      case STT_NOHOSTACCESS:
        printf("510 No command access from this host\n");
        return;
        break;
      default:
        break;
    }
    ref_time = (time_t) ntohl(reply.data.rtc.ref_time);
    ref_time_tm = *gmtime(&ref_time);
    n_samples = ntohs(reply.data.rtc.n_samples);
    n_runs = ntohs(reply.data.rtc.n_runs);
    span_seconds = ntohl(reply.data.rtc.span_seconds);
    coef_seconds_fast = WIRE2REAL(reply.data.rtc.rtc_seconds_fast);
    coef_gain_rate_ppm = WIRE2REAL(reply.data.rtc.rtc_gain_rate_ppm);
    printf("RTC ref time (UTC) : %s", asctime(&ref_time_tm));
    printf("Number of samples  : %d\n", n_samples);
    printf("Number of runs     : %d\n", n_runs);
    printf("Sample span period : ");
    print_seconds(span_seconds);
    printf("\n");
    printf("RTC is fast by     : %12.6f seconds\n", coef_seconds_fast);
    printf("RTC gains time at  : %9.3f ppm\n", coef_gain_rate_ppm);
  } else {
    printf("506 Cannot talk to daemon\n");
  }
}

/* ================================================== */

#if 0

/* This is a previous attempt at implementing the clients command.  It
   could be re-instated sometime as a way of looking at all clients in a
   particular subnet.  The problem with it is that is requires at least 5
   round trips to the server even if the server only has one client to
   report. */

typedef struct XSubnetToDo {
  struct XSubnetToDo *next;
  unsigned long ip;
  unsigned long bits;
} SubnetToDo;

static void
process_cmd_clients(char *line)
{
  CMD_Request request;
  CMD_Reply reply;
  SubnetToDo *head, *todo, *tail, *p, *next_node, *new_node;
  int submit_ok, auth_ok;
  int status;
  int i, j, nets_looked_up, clients_looked_up;
  int word;
  unsigned long mask;
  unsigned long ip, bits;
  unsigned long client_hits;
  unsigned long peer_hits;
  unsigned long cmd_hits_auth;
  unsigned long cmd_hits_normal;
  unsigned long cmd_hits_bad;
  unsigned long last_ntp_hit_ago;
  unsigned long last_cmd_hit_ago;
  char hostname_buf[32];
  const char *dns_lookup;

  int n_replies;

  head = todo = MallocNew(SubnetToDo);
  todo->next = NULL;
  /* Set up initial query = root subnet */
  todo->ip = 0;
  todo->bits = 0;
  tail = todo;

  do {

    request.command = htons(REQ_SUBNETS_ACCESSED);
    /* Build list of subnets to examine */
    i=0;
    p=todo;
    while((i < MAX_SUBNETS_ACCESSED) &&
          p &&
          (p->bits < 32)) {
      
      request.data.subnets_accessed.subnets[i].ip = htonl(p->ip);
      request.data.subnets_accessed.subnets[i].bits_specd = htonl(p->bits);
      p = p->next;
      i++;
    }         

    nets_looked_up = i;

    if (nets_looked_up == 0) {
      /* No subnets need examining */
      break;
    }

    request.data.subnets_accessed.n_subnets = htonl(nets_looked_up);

    submit_ok = submit_request(&request, &reply, &auth_ok);
  
    if (submit_ok) {
      status = ntohs(reply.status);
      switch (status) {
        case STT_SUCCESS:
          n_replies = ntohl(reply.data.subnets_accessed.n_subnets);
          for (j=0; j<n_replies; j++) {
            ip = ntohl(reply.data.subnets_accessed.subnets[j].ip);
            bits = ntohl(reply.data.subnets_accessed.subnets[j].bits_specd);
            for (i=0; i<256; i++) {
              word = i/32;
              mask = 1UL << (i%32);
              if (ntohl(reply.data.subnets_accessed.subnets[j].bitmap[word]) & mask) {
                /* Add this subnet to the todo list */
                new_node = MallocNew(SubnetToDo);
                new_node->next = NULL;
                new_node->bits = bits + 8;
                new_node->ip = ip | (i << (24 - bits));
                tail->next = new_node;
                tail = new_node;
#if 0
                printf("%08lx %2d %3d %08lx\n", ip, bits, i, new_node->ip);
#endif
              }
            }
          }

          /* Skip the todo pointer forwards by the number of nets looked
             up.  Can't do this earlier, because we might have to point
             at the next layer of subnets that have only just been
             concatenated to the linked list. */
          for (i=0; i<nets_looked_up; i++) {
            todo = todo->next;
          }
          
          break;
        case STT_BADSUBNET:
          /* We should never generate any bad subnet messages */
          assert(0);
          break;
        case STT_INACTIVE:
          printf("519 Client logging is not active in the daemon\n");
          goto cleanup;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host\n");
          goto cleanup;
        default:
          printf("520 Got unexpected error from daemon\n");
          goto cleanup;
      }
      
    } else {
      printf("506 Cannot talk to daemon\n");
      return;
    }
  } while (1); /* keep going until all subnets have been expanded,
                  down to single nodes */

  /* Now the todo list consists of client records */
  request.command = htons(REQ_CLIENT_ACCESSES);

#if 0
  printf("%d %d\n", sizeof (RPY_ClientAccesses_Client), offsetof(CMD_Reply, data.client_accesses.clients));
#endif

  printf("Hostname                   Client    Peer CmdAuth CmdNorm  CmdBad  LstN  LstC\n"
         "=========================  ======  ======  ======  ======  ======  ====  ====\n");

  do {

    i = 0;
    p = todo;
    while ((i < MAX_CLIENT_ACCESSES) &&
           p) {

      request.data.client_accesses.client_ips[i] = htonl(p->ip);
      p = p->next;
      i++;
    }

    clients_looked_up = i;

    if (clients_looked_up == 0) {
      /* No more clients to do */
      break;
    }

    request.data.client_accesses.n_clients = htonl(clients_looked_up);

    submit_ok = submit_request(&request, &reply, &auth_ok);
    
    if (submit_ok) {
      status = ntohs(reply.status);
      switch (status) {
        case STT_SUCCESS:
          n_replies = ntohl(reply.data.client_accesses.n_clients);
          for (j=0; j<n_replies; j++) {
            ip = ntohl(reply.data.client_accesses.clients[j].ip);
            if (ip != 0UL) {
              /* ip == 0 implies that the node could not be found in
                 the daemon's tables; we shouldn't ever generate this
                 case, but ignore it if we do.  (In future there might
                 be a protocol to reset the client logging; if another
                 administrator runs that while we're doing the clients
                 command, there will be a race condition that could
                 cause this). */
              
              client_hits = ntohl(reply.data.client_accesses.clients[j].client_hits);
              peer_hits = ntohl(reply.data.client_accesses.clients[j].peer_hits);
              cmd_hits_auth = ntohl(reply.data.client_accesses.clients[j].cmd_hits_auth);
              cmd_hits_normal = ntohl(reply.data.client_accesses.clients[j].cmd_hits_normal);
              cmd_hits_bad = ntohl(reply.data.client_accesses.clients[j].cmd_hits_bad);
              last_ntp_hit_ago = ntohl(reply.data.client_accesses.clients[j].last_ntp_hit_ago);
              last_cmd_hit_ago = ntohl(reply.data.client_accesses.clients[j].last_cmd_hit_ago);

              if (no_dns) {
                snprintf(hostname_buf, sizeof(hostname_buf), 
                         "%s", UTI_IPToDottedQuad(ip));
              } else {
                dns_lookup = DNS_IPAddress2Name(ip);
                hostname_buf[25] = 0;
                strncpy(hostname_buf, dns_lookup, 25);
              }
              printf("%-25s  %6d  %6d  %6d  %6d  %6d  ",
                     hostname_buf,
                     client_hits, peer_hits,
                     cmd_hits_auth, cmd_hits_normal, cmd_hits_bad);
              print_seconds(last_ntp_hit_ago);
              printf("  ");
              print_seconds(last_cmd_hit_ago);
              printf("\n");
            }
          }              

          /* Skip the todo pointer forwards by the number of nets looked
             up.  Can't do this earlier, because we might have to point
             at the next layer of subnets that have only just been
             concatenated to the linked list. */
          for (i=0; i<clients_looked_up; i++) {
            todo = todo->next;
          }

          break;

        case STT_BADSUBNET:
          /* We should never generate any bad subnet messages */
          assert(0);
          break;
        case STT_INACTIVE:
          printf("519 Client logging is not active in the daemon\n");
          goto cleanup;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host\n");
          goto cleanup;
        default:
          printf("520 Got unexpected error from daemon\n");
          goto cleanup;
      }

    }
  
  } while (1);
  
cleanup:
  for (p = head; p; ) {
    next_node = p->next;
    Free(p);
    p = next_node;
  }
  
}

#endif

/* New implementation of clients command */

static void
process_cmd_clients(char *line)
{
  CMD_Request request;
  CMD_Reply reply;
  int submit_ok, auth_ok;
  int status;
  unsigned long next_index;
  int j;
  unsigned long ip;
  unsigned long client_hits;
  unsigned long peer_hits;
  unsigned long cmd_hits_auth;
  unsigned long cmd_hits_normal;
  unsigned long cmd_hits_bad;
  unsigned long last_ntp_hit_ago;
  unsigned long last_cmd_hit_ago;
  char hostname_buf[32];
  const char *dns_lookup;

  int n_replies;
  int n_indices_in_table;

  next_index = 0;

  printf("Hostname                   Client    Peer CmdAuth CmdNorm  CmdBad  LstN  LstC\n"
         "=========================  ======  ======  ======  ======  ======  ====  ====\n");

  do {

    request.command = htons(REQ_CLIENT_ACCESSES_BY_INDEX);
    request.data.client_accesses_by_index.first_index = htonl(next_index);
    request.data.client_accesses_by_index.n_indices = htonl(MAX_CLIENT_ACCESSES);

    submit_ok = submit_request(&request, &reply, &auth_ok);
  
    if (submit_ok) {
      status = ntohs(reply.status);
      switch (status) {
        case STT_SUCCESS:
          n_replies = ntohl(reply.data.client_accesses_by_index.n_clients);
          n_indices_in_table = ntohl(reply.data.client_accesses_by_index.n_indices);
          if (n_replies == 0) {
            goto finished;
          }
          for (j=0; j<n_replies; j++) {
            ip = ntohl(reply.data.client_accesses_by_index.clients[j].ip);
            if (ip != 0UL) {
              /* ip == 0 implies that the node could not be found in
                 the daemon's tables; we shouldn't ever generate this
                 case, but ignore it if we do.  (In future there might
                 be a protocol to reset the client logging; if another
                 administrator runs that while we're doing the clients
                 command, there will be a race condition that could
                 cause this). */
              
              client_hits = ntohl(reply.data.client_accesses_by_index.clients[j].client_hits);
              peer_hits = ntohl(reply.data.client_accesses_by_index.clients[j].peer_hits);
              cmd_hits_auth = ntohl(reply.data.client_accesses_by_index.clients[j].cmd_hits_auth);
              cmd_hits_normal = ntohl(reply.data.client_accesses_by_index.clients[j].cmd_hits_normal);
              cmd_hits_bad = ntohl(reply.data.client_accesses_by_index.clients[j].cmd_hits_bad);
              last_ntp_hit_ago = ntohl(reply.data.client_accesses_by_index.clients[j].last_ntp_hit_ago);
              last_cmd_hit_ago = ntohl(reply.data.client_accesses_by_index.clients[j].last_cmd_hit_ago);

              if (no_dns) {
                snprintf(hostname_buf, sizeof(hostname_buf),
                         "%s", UTI_IPToDottedQuad(ip));
              } else {
                dns_lookup = DNS_IPAddress2Name(ip);
                hostname_buf[25] = 0;
                strncpy(hostname_buf, dns_lookup, 25);
              }
              printf("%-25s  %6ld  %6ld  %6ld  %6ld  %6ld  ",
                     hostname_buf,
                     client_hits, peer_hits,
                     cmd_hits_auth, cmd_hits_normal, cmd_hits_bad);
              print_seconds(last_ntp_hit_ago);
              printf("  ");
              print_seconds(last_cmd_hit_ago);
              printf("\n");
            }
          }              

          /* Set the next index to probe based on what the server tells us */
          next_index = ntohl(reply.data.client_accesses_by_index.next_index);
          if (next_index >= n_indices_in_table) {
            goto finished;
          }

          break;
        case STT_BADSUBNET:
          /* We should never generate any bad subnet messages */
          assert(0);
          break;
        case STT_INACTIVE:
          printf("519 Client logging is not active in the daemon\n");
          goto finished;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host\n");
          goto finished;
        default:
          printf("520 Got unexpected error from daemon\n");
          goto finished;
      }
      
    } else {
      printf("506 Cannot talk to daemon\n");
      return;
    }
  } while (1); /* keep going until all subnets have been expanded,
                  down to single nodes */

finished:
  return;

}


/* ================================================== */
/* Process the manual list command */
static void
process_cmd_manual_list(const char *line)
{
  CMD_Request request;
  CMD_Reply reply;
  int submit_ok, auth_ok;
  int status;
  int n_samples;
  RPY_ManualListSample *sample;
  int i;
  time_t when;
  double slewed_offset, orig_offset, residual;

  request.command = htons(REQ_MANUAL_LIST);
  submit_ok = submit_request(&request, &reply, &auth_ok);
  
  if (submit_ok) {
    status = ntohs(reply.status);
      switch (status) {
        case STT_SUCCESS:
          n_samples = ntohl(reply.data.manual_list.n_samples);
          printf("210 n_samples = %d\n", n_samples);
          printf("#    Date  Time(UTC)    Slewed   Original   Residual\n"
                 "====================================================\n");
          for (i=0; i<n_samples; i++) {
            sample = &reply.data.manual_list.samples[i];
            when = ntohl(sample->when);
            slewed_offset = WIRE2REAL(sample->slewed_offset);
            orig_offset = WIRE2REAL(sample->orig_offset);
            residual = WIRE2REAL(sample->residual);
            printf("%2d %s %10.2f %10.2f %10.2f\n", i, time_to_log_form(when), slewed_offset, orig_offset, residual);
          }
          break;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host\n");
          break;
        default:
          printf("520 Got unexpected error from daemon\n");
          break;
      }
  }

}

/* ================================================== */

static void
process_cmd_manual_delete(const char *line)
{
  int index;
  CMD_Request request;
  CMD_Reply reply;
  int submit_ok, auth_ok;
  int status;

  if (sscanf(line, "%d", &index) != 1) {
    fprintf(stderr, "Bad syntax for manual delete command\n");
    return;

  }

  request.command = htons(REQ_MANUAL_DELETE);
  request.data.manual_delete.index = htonl(index);

  submit_ok = submit_request(&request, &reply, &auth_ok);
  
  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_SUCCESS:
        printf("200 OK\n");
        break;
      case STT_BADSAMPLE:
        printf("516 Sample index out of range\n");
        break;
      case STT_NOHOSTACCESS:
        printf("510 No command access from this host\n");
        break;
      default:
        printf("520 Got unexpected error from daemon\n");
        break;
    }
  }

}

/* ================================================== */

static void
process_cmd_settime(char *line)
{
  time_t now, new_time;
  CMD_Request request;
  CMD_Reply reply;
  int submit_ok, reply_auth_ok;
  long offset_cs;
  double dfreq_ppm, new_afreq_ppm;
  double offset;
  int status;

  now = time(NULL);
  new_time = get_date(line, &now);

  if (new_time == -1) {
    printf("510 - Could not parse date string\n");
  } else {
    request.data.settime.ts.tv_sec = htonl(new_time);
    request.data.settime.ts.tv_usec = htonl(0);
    request.command = htons(REQ_SETTIME);
    submit_ok = submit_request(&request, &reply, &reply_auth_ok);
    if (submit_ok) {
      status = ntohs(reply.status);
      switch (status) {
        case STT_SUCCESS:
          offset_cs = ntohl(reply.data.manual_timestamp.centiseconds);
          offset = 0.01 * (double) offset_cs;
          dfreq_ppm = WIRE2REAL(reply.data.manual_timestamp.dfreq_ppm);
          new_afreq_ppm = WIRE2REAL(reply.data.manual_timestamp.new_afreq_ppm);
          printf("200 OK : Clock was %.2f seconds fast.  Frequency change = %.2fppm, new frequency = %.2fppm",
                 offset, dfreq_ppm, new_afreq_ppm);
          break;
        case STT_FAILED:
          printf("500 Failure");
          break;
        case STT_UNAUTH:
          printf("501 Not authorised");
          break;
        case STT_INVALID:
          printf("502 Invalid command");
          break;
        case STT_NOTENABLED:
          printf("505 Facility not enabled in daemon");
          break;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host");
          break;
      }
      if (reply_auth_ok) {
        printf("\n");
      } else {
        printf(" --- Reply not authenticated\n");
      }
    } else {
      printf("506 Could not submit settime command\n");
    }
  }

}

/* ================================================== */

static void
process_cmd_rekey(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_REKEY);
}

/* ================================================== */

static void
process_cmd_makestep(CMD_Request *msg, char *line)
{
  msg->command = htons(REQ_MAKESTEP);
}

/* ================================================== */

static void
process_cmd_activity(const char *line)
{
  CMD_Request request;
  CMD_Reply reply;
  int submit_ok, status, reply_auth_ok;
  request.command = htons(REQ_ACTIVITY);
  submit_ok = submit_request(&request, &reply, &reply_auth_ok);
  if (submit_ok) {
    status = ntohs(reply.status);
    switch (status) {
      case STT_SUCCESS:
        printf("200 OK\n"
               "%ld sources online\n"
               "%ld sources offline\n"
               "%ld sources doing burst (return to online)\n"
               "%ld sources doing burst (return to offline)\n",
                (long) ntohl(reply.data.activity.online),
                (long) ntohl(reply.data.activity.offline),
                (long) ntohl(reply.data.activity.burst_online),
                (long) ntohl(reply.data.activity.burst_offline));
        break;
      default:
        printf("Unexpected error returned\n");
        break;
    }
    if (!reply_auth_ok) {
      printf(" --- Reply not authenticated\n");
    }
  } else {
    printf("506 Could not submit activity command\n");
  }
}

/* ================================================== */

static int
process_line(char *line)
{
  char *p;
  int quit;
  int do_normal_submit;
  CMD_Request tx_message;
  CMD_Reply rx_message;
  int reply_auth_ok, request_submitted_ok;

  quit = 0;

  do_normal_submit = 1;

  /* Check for line being blank */
  p = line;
  while (*p && isspace((unsigned char)*p)) p++;
  if (!*p) return quit;

  if (!strncmp(p, "offline", 7)) {
    do_normal_submit = process_cmd_offline(&tx_message, p+7);
  } else if (!strncmp(p, "online", 6)) {
    do_normal_submit = process_cmd_online(&tx_message, p+6);
  } else if (!strncmp(p, "burst", 5)) {
    do_normal_submit = process_cmd_burst(&tx_message, p+5);
  } else if (!strncmp(p, "password", 8)) {
    do_normal_submit = process_cmd_password(&tx_message, p+8);
  } else if (!strncmp(p, "minpoll", 7)) {
    do_normal_submit = process_cmd_minpoll(&tx_message, p+7);
  } else if (!strncmp(p, "maxpoll", 7)) {
    do_normal_submit = process_cmd_maxpoll(&tx_message, p+7);
  } else if (!strncmp(p, "dump", 4)) {
    process_cmd_dump(&tx_message, p+4);
  } else if (!strncmp(p, "maxdelayratio", 13)) {
    do_normal_submit = process_cmd_maxdelayratio(&tx_message, p+13);
  } else if (!strncmp(p, "maxdelay", 8)) {
    do_normal_submit = process_cmd_maxdelay(&tx_message, p+8);
  } else if (!strncmp(p, "maxupdateskew", 13)) {
    do_normal_submit = process_cmd_maxupdateskew(&tx_message, p+13);
  } else if (!strncmp(p, "settime", 7)) {
    do_normal_submit = 0;
    process_cmd_settime(p+7);
  } else if (!strncmp(p, "local", 5)) {
    do_normal_submit = process_cmd_local(&tx_message, p+5);
  } else if (!strncmp(p, "manual", 6)) {
    do_normal_submit = process_cmd_manual(&tx_message, p+6);
  } else if (!strncmp(p, "sourcestats", 11)) {
    do_normal_submit = 0;
    process_cmd_sourcestats(p+11);
  } else if (!strncmp(p, "sources", 7)) {
    do_normal_submit = 0;
    process_cmd_sources(p+7);
  } else if (!strncmp(p, "rekey", 5)) {
    process_cmd_rekey(&tx_message, p+5);
  } else if (!strncmp(p, "allow all", 9)) {
    do_normal_submit = process_cmd_allowall(&tx_message, p+9);
  } else if (!strncmp(p, "allow", 5)) {
    do_normal_submit = process_cmd_allow(&tx_message, p+5);
  } else if (!strncmp(p, "deny all", 8)) {
    do_normal_submit = process_cmd_denyall(&tx_message, p+8);
  } else if (!strncmp(p, "deny", 4)) {
    do_normal_submit = process_cmd_deny(&tx_message, p+4);
  } else if (!strncmp(p, "cmdallow all", 12)) {
    do_normal_submit = process_cmd_cmdallowall(&tx_message, p+12);
  } else if (!strncmp(p, "cmdallow", 8)) {
    do_normal_submit = process_cmd_cmdallow(&tx_message, p+8);
  } else if (!strncmp(p, "cmddeny all", 11)) {
    do_normal_submit = process_cmd_cmddenyall(&tx_message, p+11);
  } else if (!strncmp(p, "cmddeny", 7)) {
    do_normal_submit = process_cmd_cmddeny(&tx_message, p+7);
  } else if (!strncmp(p, "accheck", 7)) {
    do_normal_submit = process_cmd_accheck(&tx_message, p+7);
  } else if (!strncmp(p, "cmdaccheck", 10)) {
    do_normal_submit = process_cmd_cmdaccheck(&tx_message, p+10);
  } else if (!strncmp(p, "add server", 10)) {
    do_normal_submit = process_cmd_add_server(&tx_message, p+10);
  } else if (!strncmp(p, "add peer", 8)) {
    do_normal_submit = process_cmd_add_peer(&tx_message, p+8);
  } else if (!strncmp(p, "delete", 6)) {
    do_normal_submit = process_cmd_delete(&tx_message, p+6);
  } else if (!strncmp(p, "writertc", 7)) {
    process_cmd_writertc(&tx_message, p+7);
  } else if (!strncmp(p, "rtcdata", 7)) {
    do_normal_submit = 0;
    process_cmd_rtcreport(p);
  } else if (!strncmp(p, "trimrtc", 7)) {
    process_cmd_trimrtc(&tx_message, p);
  } else if (!strncmp(p, "cyclelogs", 9)) {
    process_cmd_cyclelogs(&tx_message, p);
  } else if (!strncmp(p, "dfreq", 5)) {
    process_cmd_dfreq(&tx_message, p+5);
  } else if (!strncmp(p, "doffset", 7)) {
    process_cmd_doffset(&tx_message, p+7);
  } else if (!strncmp(p, "tracking", 8)) {
    process_cmd_tracking(p+8);
    do_normal_submit = 0;
  } else if (!strncmp(p, "clients", 7)) {
    process_cmd_clients(p+7);
    do_normal_submit = 0;
  } else if (!strncmp(p, "makestep", 8)) {
    process_cmd_makestep(&tx_message, p+8);
  } else if (!strncmp(p, "activity", 8)) {
    process_cmd_activity(p+8);
    do_normal_submit = 0;
  } else if (!strncmp(p, "help", 4)) {
    do_normal_submit = 0;
    give_help();
  } else if (!strncmp(p, "quit", 4)) {
    do_normal_submit = 0;
    quit = 1;
  } else if (!strncmp(p, "exit", 4)) {
    do_normal_submit = 0;
    quit = 1;
  } else {
    fprintf(stderr, "Unrecognized command\n");
    do_normal_submit = 0;
  }
    
  if (do_normal_submit) {

    request_submitted_ok = submit_request(&tx_message, &rx_message, &reply_auth_ok);

    if (request_submitted_ok) {
      switch(ntohs(rx_message.status)) {
        case STT_SUCCESS:
          printf("200 OK");
          break;
        case STT_FAILED:
          printf("500 Failure");
          break;
        case STT_UNAUTH:
          printf("501 Not authorised");
          break;
        case STT_INVALID:
          printf("502 Invalid command");
          break;
        case STT_NOSUCHSOURCE:
          printf("503 No such source");
          break;
        case STT_INVALIDTS:
          printf("504 Duplicate or stale logon detected");
          break;
        case STT_NOTENABLED:
          printf("505 Facility not enabled in daemon");
          break;
        case STT_BADSUBNET:
          printf("507 Bad subnet");
          break;
        case STT_ACCESSALLOWED:
          printf("208 Access allowed");
          break;
        case STT_ACCESSDENIED:
          printf("209 Access denied");
          break;
        case STT_NOHOSTACCESS:
          printf("510 No command access from this host");
          break;
        case STT_SOURCEALREADYKNOWN:
          printf("511 Source already present");
          break;
        case STT_TOOMANYSOURCES:
          printf("512 Too many sources present");
          break;
        case STT_NORTC:
          printf("513 RTC driver not running");
          break;
        case STT_BADRTCFILE:
          printf("514 Can't write RTC parameters");
          break;
      }
      
      if (reply_auth_ok) {
        printf("\n");
      } else {
        printf(" --- Reply not authenticated\n");
      }
    }
  }

  return quit;
}

/* ================================================== */

static void
process_args(int argc, char **argv)
{
  int total_length, i;
  char *line;

  total_length = 0;
  for(i=0; i<argc; i++) {
    total_length += strlen(argv[i]);
  }

  line = (char *) malloc((2 + total_length) * sizeof(char));
  line[0] = 0;
  for (i=0; i<argc; i++) {
    strcat(line, argv[i]);
  }
  strcat(line, "\n");

  process_line(line);

  free(line);

  return;
}

/* ================================================== */

static void
display_gpl(void)
{
    printf("chrony version %s, copyright (C) 1997-2002 Richard P. Curnow\n"
           "chrony comes with ABSOLUTELY NO WARRANTY.\n"
           "This is free software, and you are welcome to redistribute it\n"
           "under certain conditions.\n"
           "See the GNU General Public License version 2 for details.\n\n",
           PROGRAM_VERSION_STRING);
}

/* ================================================== */

int
main(int argc, char **argv)
{
  char *line;
  const char *progname = argv[0];
  const char *hostname = "localhost";
  int quit = 0;
  int port = DEFAULT_CANDM_PORT;

  /* Parse command line options */
  while (++argv, --argc) {
    if (!strcmp(*argv, "-h")) {
      ++argv, --argc;
      if (*argv) {
        hostname = *argv;
      }
    } else if (!strcmp(*argv, "-p")) {
      ++argv, --argc;
      if (*argv) {
        port = atoi(*argv);
      }
    } else if (!strcmp(*argv, "-n")) {
      no_dns = 1;
    } else if (!strcmp("-v", *argv) || !strcmp("--version",*argv)) {
      printf("chronyc (chrony) version %s\n", PROGRAM_VERSION_STRING);
      exit(0);
    } else if (!strncmp(*argv, "-", 1)) {
      fprintf(stderr, "Usage : %s [-h <hostname>] [-p <port-number>] [-n] [command]\n", progname);
      exit(1);
    } else {
      break; /* And process remainder of line as a command */
    }
  }

  if (isatty(0) && isatty(1) && isatty(2)) {
    on_terminal = 1;
  }

  if (on_terminal && (argc == 0)) {
    display_gpl();
  }
  
  open_io(hostname, port);

  if (argc > 0) {
    process_args(argc, argv);
  } else {
    do {
      line = read_line();
      if (line) {
        quit = process_line(line);
      }else {
	/* supply the final '\n' when user exits via ^D */
        if( on_terminal ) printf("\n");
      }
    } while (line && !quit);
  }

  close_io();

  return 0;
}


