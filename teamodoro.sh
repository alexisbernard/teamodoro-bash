#!/usr/bin/env bash

# Append to your crontab:
# # m h  dom mon dow   command
# 0,30 9,10,11,12 * * * pomodoro.sh start
# 25,55 9,10,11,12 * * * pomodoro.sh stop 

dir=`dirname $0`

case $1 in
start)
  play $dir/ring.wav
  ;;
stop)
  play $dir/ring.wav
  ;;
*)
  echo "Bad command, ony start and stop are accepted."
  exit 1
esac

