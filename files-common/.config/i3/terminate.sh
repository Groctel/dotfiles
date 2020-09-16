#!/bin/sh

# ==============================================================================
# I3 TERMINATOR
# ------------------------------------------------------------------------------
# Controls the termination of the i3 session.
# ------------------------------------------------------------------------------
# ARGS:
# - $@ -> Strings : Operation to perform
#   Valid operations are:
#   - exit -> Exit i3 instead of powering off the machine
#   - update -> Update the system's pacman repositories before terminating
# ==============================================================================

fexit=0
fterminate=1
fupdate=0

while [ $# -gt 0 ]; do
	case "$1" in
		exit)
			fexit=1
		;;
		update)
			fupdate=1
		;;
	esac

	shift
done

[ $fupdate -eq 1 ] && {
	fterminate=0
	kitty sudo pacman -Syu \&\& fterminate=1
}

[ $fterminate -eq 1 ] && {
	([ $fexit -eq 1 ] && i3 exit) || kitty --hold echo "failed"
}
