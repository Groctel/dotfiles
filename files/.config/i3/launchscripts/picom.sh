#!/bin/sh

# ==============================================================================
# GROCTEL'S PICOM LAUNCHSCRIPT
# ------------------------------------------------------------------------------
# Picom is a compositor for X, a program that renders a sub-tree of the
# window hierarchy in an off-screen buffer. It applies visual effects to the
# windows in the window manager.
# More information: https://wiki.archlinux.org/index.php/Picom
# ==============================================================================

# If picom is running, kill it to prevent multiple instances
if pgrep picom; then
	killall -q picom
fi

# Load picom
picom --experimental-backends
