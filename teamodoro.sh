#!/usr/bin/env bash

# Append to your crontab:
# # m h  dom mon dow   command
# 0,30 9,10,11,12 * * * teamodoro.sh start
# 25,55 9,10,11,12 * * * teamodoro.sh stop

dir=`dirname $0`

case $1 in
start)
  play $dir/start.wav
  ;;
stop)
  play $dir/stop.wav
  ;;
*)
  echo "Bad command, only start and stop are accepted."
  exit 1
esac

