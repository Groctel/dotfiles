#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	# Launch bar1 and bar2
	MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
done
