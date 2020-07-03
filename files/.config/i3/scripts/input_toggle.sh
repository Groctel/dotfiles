#!/bin/sh

# ==============================================================================
# GROCTEL'S INPUT TOGGLER FOR I3WM
# ------------------------------------------------------------------------------
# Check's whether a device is accepting user input and changes its value to
# the opposite.
# This script is designed to be run from an keysym.
# ------------------------------------------------------------------------------
# ARGUMENTS:
# - $1 -> INT : Device ID (get from `xinput list`)
# ==============================================================================

status=$(xinput list-props "$1" | grep "Device Enabled" | awk '{print $4;}')

if [ "$status" -eq 1 ]; then
	xinput set-prop "$1" "Device Enabled" 0;
else
	xinput set-prop "$1" "Device Enabled" 1;
fi
