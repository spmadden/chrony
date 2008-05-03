#! /bin/sh
#
# This file was automatically customized by debmake on Fri,  6 Nov 1998 23:00:08 -0600
#
# Written by Miquel van Smoorenburg <miquels@drinkel.ow.org>.
# Modified for Debian GNU/Linux by Ian Murdock <imurdock@gnu.ai.mit.edu>.
# Modified for Debian by Christoph Lameter <clameter@debian.org>
# Modified for chrony by John Hasler <jhasler@debian.org> 1998-2006

### BEGIN INIT INFO
# Provides:          time-daemon
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description:  Controls chronyd NTP time daemon
# Description:       Chronyd is the NTP time daemon in the Chrony package
#              
### END INIT INFO


PATH=/bin:/usr/bin:/sbin:/usr/sbin
DAEMON=/usr/sbin/chronyd
FLAGS="defaults"
NAME="chronyd"
DESC="time daemon"

test -f $DAEMON || exit 0

case "$1" in
  start)
    start-stop-daemon --start --verbose --exec $DAEMON
    sleep 1
    netstat -r 2>/dev/null | grep -q default && /etc/ppp/ip-up.d/chrony > /dev/null || true
    ;;
  stop)
    start-stop-daemon --stop --verbose --oknodo --exec $DAEMON
    ;;
  restart|force-reload)
        #
        #       If the "reload" option is implemented, move the "force-reload"
        #       option to the "reload" entry above. If not, "force-reload" is
        #       just the same as "restart".
        #                                                                                   
        echo -n "Restarting $DESC: "
        start-stop-daemon --stop --quiet --exec $DAEMON
        sleep 1
        start-stop-daemon --start --quiet --exec $DAEMON -- -r
        sleep 1
        netstat -r 2>/dev/null | grep -q default && /etc/ppp/ip-up.d/chrony > /dev/null || true
        echo "$NAME."
        ;;
  *)
    echo "Usage: /etc/init.d/chrony {start|stop|restart|force-reload}"
    exit 1
    ;;
esac

exit 0
