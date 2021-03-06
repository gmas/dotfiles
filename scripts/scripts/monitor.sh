#!/bin/bash

#case $1 left,right,off

case "$1" in
  "left") echo "Turning on monitor on left"
          xrandr --output LVDS-1 --auto --right-of DP-1
          xrandr --output DP-1 --auto --left-of LVDS-1
          ;;

  "right") echo "Turning on monitor on right"
          xrandr --output LVDS --auto --left-of DP-1
          xrandr --output DP-1 --auto --right-of LVDS-1
          ;;

  "off") echo "Turning monitor off"
          xrandr --output DP-1 --off
          xrandr --output LVDS-1 --auto
          ;;

  *) echo "Must pass left, right or off"
      ;;
esac

exit 0
