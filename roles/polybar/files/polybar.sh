#!/bin/env bash
# main idea from https://github.com/polybar/polybar/issues/763#issuecomment-450940924
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected " | cut -d" " -f1)
  primary=$(xrandr --query | grep " primary " | cut -d" " -f1)
  tray_output='DP-2-1'

  for m in $outputs; do
    if test "$m" = "$primary"; then
        tray_output="$m"
    fi
  done

  for m in $outputs; do
    export MONITOR="$m"
    export TRAY_POSITION=none
    if test "$m" = "$tray_output"; then
      TRAY_POSITION=right
    fi
    polybar --reload "$1" -c ~/.config/polybar/config.ini </dev/null > "polybar-$m.log" 2>&1 200>&- &
    disown
  done
) 200>polybar-launch.lock