#!/bin/sh

# ==============================================================================
# GROCTEL'S REDSHIFT LAUNCHSCRIPT
# ------------------------------------------------------------------------------
# Redshift is a service that adjusts the colour of the screen according to the
# user's surroundings. It's used to turn the screen red at night so it's not
# uncomfortable.
# More information: https://wiki.archlinux.org/index.php/Redshift
# ==============================================================================

# If redshift is running, kill it to prevent multiple instances
if pgrep redshift; then
	redshift -x;
	killall -q redshift;
fi

# Launch redshift
redshift
