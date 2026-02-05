#!/usr/bin/env sh

#echo 'The following command terminates the "npm start" process using its PID'
#echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
#echo 'was executed.'
#set -x
#kill $(cat .pidfile) || true

#!/bin/sh

if [ ! -f .pidfile ]; then
  echo "No pidfile found, nothing to kill"
  exit 0
fi

PID=$(cat .pidfile)

if ps -p "$PID" > /dev/null 2>&1; then
  echo "Killing process $PID"
  kill "$PID"
else
  echo "Process $PID already stopped"
fi

exit 0
