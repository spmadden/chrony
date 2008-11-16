#! /bin/sh
#
# Written by Miquel van Smoorenburg <miquels@drinkel.ow.org>.
# Modified for Debian GNU/Linux by Ian Murdock <imurdock@gnu.ai.mit.edu>.
# Modified for Debian by Christoph Lameter <clameter@debian.org>
# Modified for chrony by John Hasler <jhasler@debian.org> 1998-2008

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

putonline ()
{ # Do we have a default route?  If so put chronyd online.
    if timelimit -q -s9 -t5 -- netstat -rn 2>/dev/null | grep UG | cut -f 1 -d ' ' | grep -q '0\.0\.0\.0' 
    then
	sleep 1  # Chronyd can take a while to start.
	KEY=$(awk '$1 ~ /^commandkey$/ { print $2; exit}' /etc/chrony/chrony.conf)
	PASSWORD=`awk '$1 ~ /^'$KEY'$/ {print $2; exit}' /etc/chrony/chrony.keys`
	# Make sure chronyc can't hang us up.
	if timelimit -q -s9 -t5 -- /usr/bin/chronyc > /dev/null << EOF
password $PASSWORD
online
burst 5/10
quit
EOF
        then
                touch /var/run/chrony-ppp-up
                echo "$NAME is running and online."
        else
                rm -f /var/run/chrony-ppp-up
                echo "$NAME is running and offline."    
        fi
    fi
}

case "$1" in
    start)
	start-stop-daemon --start --verbose --exec $DAEMON || { echo "$DAEMON already running."; exit 1; }
	/bin/pidof $DAEMON > /dev/null || { echo "$DAEMON failed to start."; exit 1; }
	putonline
	;;
    stop)
	start-stop-daemon --stop --verbose --oknodo --exec $DAEMON
	rm -f /var/run/chrony-ppp-up
	;;
    restart|force-reload)
	echo -n "Restarting $DESC: "
	start-stop-daemon --stop --quiet --exec $DAEMON
	sleep 1
	start-stop-daemon --start --quiet --exec $DAEMON -- -r
	/bin/pidof $DAEMON > /dev/null || { echo "$DAEMON failed to restart."; rm -f /var/run/chrony-ppp-up; exit 1; }
	putonline
	;;
    *)
	echo "Usage: /etc/init.d/chrony {start|stop|restart|force-reload}"
	exit 1
	;;
esac

exit 0
