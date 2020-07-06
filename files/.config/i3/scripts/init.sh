#!/bin/sh

# ==============================================================================
# I3 INITIALISER
# ------------------------------------------------------------------------------
# Controls the initialisation of the userspace processes started with the i3
# session.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String : Operation to perform
# ==============================================================================

[ "$1" = "always" ] && {
	path="$(echo "$0" | sed 's/\/'"$(basename "$0")"'//')"

	# Call the individual initialiser of every file in ./init/
	"$path"/init/entr.sh &
	"$path"/init/nm-applet.sh &
	"$path"/init/picom.sh &
	"$path"/init/polybar.sh &
	"$path"/init/redshift.sh &
}

[ "$1" = "first" ] && {
	# Sequentially run these commands
	feh --bg-fill ~/Pictures/departure-songs.jpg
	kitty sh -c "pfetch; zsh"
}
