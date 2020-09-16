#!/bin/sh

# ==============================================================================
# NM-APPLET INITIALISER
# ------------------------------------------------------------------------------
# Nm-applet is a GTK 3 front-end for NetworkManager that runs on the system
# tray. It's used to connect to the internet.
# More information: https://wiki.archlinux.org/index.php/NetworkManager
# ==============================================================================

# If nm-applet is running, kill it to prevent multiple instances
pgrep nm-applet && killall -q nm-applet

# Load nm-applet
nm-applet
