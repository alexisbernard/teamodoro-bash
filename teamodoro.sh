#!/usr/bin/env bash

# Append to your crontab:
# # m h  dom mon dow   command
# 0,30 9,10,11,12 * * * teamodoro.sh start
# 25,55 9,10,11,12 * * * teamodoro.sh stop

function teamodoro-show-countdown {
  for n in `seq $2 -1 0`; do
    dcled -m "$1 $n min left" -r &
    pid=$!
    sleep 60
    kill $pid
  done
}

dir=`dirname $0`

case $1 in
start)
  play $dir/start.wav
  teamodoro-show-countdown "POMODORO" 25
  ;;
stop)
  play $dir/stop.wav
  teamodoro-show-countdown "BREAK" 5
  ;;
*)
  echo "Bad command, only start and stop are accepted."
  exit 1
esac

