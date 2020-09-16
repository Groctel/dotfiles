#!/bin/sh

# ==============================================================================
# GROCTEL'S INPUT TOGGLER FOR I3WM
# ------------------------------------------------------------------------------
# Check's whether a device is accepting user input and changes its value to
# the opposite.
# This script is designed to be run from an keysym.
# ------------------------------------------------------------------------------
# ARGUMENTS:
# - $1 -> String : Operation to perform, commented before each line
# - $2 -> INT : Device descriptor from `xinput list`
# - $3 -> String (optional) : Optional argument required by some operations
# - $4 -> String (optional) : Optional argument required by some operations
# ==============================================================================

device=$(xinput list \
       | grep "$2" \
       | awk '{print $6;}' \
       | sed 's/id=//')

case "$1" in
# Toggle the device on or off
	"toggle")
		status=$(xinput list-props "$device" \
		       | grep "Device Enabled" \
		       | awk '{print $4;}')

		if [ "$status" -eq 1 ]; then
			xinput set-prop "$device" "Device Enabled" 0;
		else
			xinput set-prop "$device" "Device Enabled" 1;
		fi
	;;

# Set an option $3 to a value $4
	"set")
		xinput set-prop "$device" "$3" "$4"

esac
