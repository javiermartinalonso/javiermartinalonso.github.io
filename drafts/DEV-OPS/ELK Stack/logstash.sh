#!/bin/sh
### BEGIN INIT INFO
# Provides:          Logstash
# Required-Start:    $local_fs $network $named $time $syslog
# Required-Stop:     $local_fs $network $named $time $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Description:       Starts and stops the Logstash, which should be located at /usr/share/elasticsearch
### END INIT INFO

SERVICE_NAME=Logstash
LOGSTASH_HOME=/opt/elk/logstash-6.2.2
START="$LOGSTASH_HOME/bin/logstash -f $LOGSTASH_HOME/config/logstash.conf"
STOP=$LOGSTASH_HOME/bin/shutdown.sh
RUNAS=elkuser

JAVA_HOME="/opt/provision/java/jdk1.8.0_111/"
JAVACMD="/opt/provision/java/jdk1.8.0_111/bin/java"
PATH="/opt/provision/java/jdk1.8.0_111/bin:$JAVA_HOME:$PATH"

PIDFILE=/var/run/logstash.pid
LOGFILE=/var/log/elk/logstash.log

start() {
  if [ -f /var/run/$PIDNAME ] && kill -0 $(cat /var/run/$PIDNAME); then
    echo "$SERVICE_NAME is already running" >&2
    return 1
  fi
  echo "Starting $SERVICE_NAME" >&2
  echo "$START"
  su -c "LOGSTASH_HOME=$LOGSTASH_HOME JAVA_HOME=$JAVA_HOME JAVACMD=$JAVACMD PATH=$PATH $START &> '$LOGFILE' & echo \$!" $RUNAS > "$PIDFILE"
  echo "$SERVICE_NAME is started" >&2
}

stop() {
  if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
    echo "$SERVICE_NAME is not running" >&2
    if [ -f "$PIDFILE" ]; then
        echo "Removing $PIDFILE"
        rm $PIDFILE
    fi
    return 1
  fi
  echo "Stopping $SERVICE_NAME" >&2
  su -c "$STOP &> '$LOGFILE' & echo \$!" $RUNAS && kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
  echo "$SERVICE_NAME has stopped" >&2
}

status() {
    printf "%-50s" "Checking $SERVICE_NAME..."
    if [ -f $PIDFILE ]; then
        PID=`cat $PIDFILE`
        if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
            printf "%s\n" "Process dead but pidfile exists"
            exit 1
        else
            echo "$SERVICE_NAME is running"
        fi
    else
        printf "%s\n" "$SERVICE_NAME is not running"
        exit 3
    fi
}

case "$1" in
  status)
    status
    ;;
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|restart|status|stop}"
esac

exit 0

