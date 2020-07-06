#!/bin/sh

# ==============================================================================
# REDSHIFT INITIALISER
# ------------------------------------------------------------------------------
# Redshift is a service that adjusts the colour of the screen according to the
# user's surroundings. It's used to turn the screen red at night so it's not
# uncomfortable.
# More information: https://wiki.archlinux.org/index.php/Redshift
# ==============================================================================

# If redshift is running, kill it to prevent multiple instances
pgrep redshift && killall -q redshift;

# Load redshift
redshift -xt 6500K:6500K;
