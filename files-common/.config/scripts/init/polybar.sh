#!/bin/sh

# ==============================================================================
# POLYBAR INITIALISER
# ------------------------------------------------------------------------------
# Polybar is a fast and easy-to-use tool status bar that aims to help users
# build beautiful and highly customizable status bars for their desktop
# environment, without the need of having a black belt in shell scripting.
# ==============================================================================

# If polybar is running, kill it to prevent multiple instances
pgrep polybar && killall -q polybar

# Load polybar
~/.config/polybar/launch.sh
