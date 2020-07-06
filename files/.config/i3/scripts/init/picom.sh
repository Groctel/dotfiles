#!/bin/sh

# ==============================================================================
# PICOM INITIALISER
# ------------------------------------------------------------------------------
# Picom is a compositor for X, a program that renders a sub-tree of the
# window hierarchy in an off-screen buffer. It applies visual effects to the
# windows in the window manager.
# More information: https://wiki.archlinux.org/index.php/Picom
# ==============================================================================

# If picom is running, kill it to prevent multiple instances
pgrep picom$ && killall picom

# Load picom
picom --experimental-backends
