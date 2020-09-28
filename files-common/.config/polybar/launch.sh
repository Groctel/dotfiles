#!/usr/bin/sh

killall -q polybar

for m in $(xrandr --query | grep " connected" | cut -d" " -f1)
do
	export MONITOR="$m"
	polybar -c ~/.config/polybar/config.ini main &
done
