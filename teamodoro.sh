#!/usr/bin/env bash

# Append to your crontab:
# # m h  dom mon dow   command
# 0,30 9,10,11,12 * * * teamodoro.sh start
# 25,55 9,10,11,12 * * * teamodoro.sh stop

function teamodoro-show-countdown {
  for n in `seq 25 -1 0`; do
    dcled -m "POMODORO $n min left" -r &
    pid=$!
    sleep 60
    kill $pid
  done
}

dir=`dirname $0`

case $1 in
start)
  play $dir/start.wav
  teamodoro-show-countdown
  ;;
stop)
  play $dir/stop.wav
  ;;
*)
  echo "Bad command, only start and stop are accepted."
  exit 1
esac

