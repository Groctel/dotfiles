#!/bin/sh

# ==============================================================================
# GROCTEL'S NM-APPLET LAUNCHSCRIPT
# ------------------------------------------------------------------------------
# Nm-applet is a GTK 3 front-end for NetworkManager that runs on the system
# tray. It's used to connect to the internet.
# More information: https://wiki.archlinux.org/index.php/NetworkManager
# ==============================================================================

# If nm-applet is running, kill it to prevent multiple instances
if pgrep nm-applet; then
	killall -q nm-applet
	#while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
fi

# Launch nm-applet
nm-applet
