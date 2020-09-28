#!/bin/sh

operation="$1"

[ "$operation" = "always" ] && {
	# Call the individual initialiser of every file in ./init/
	path="$(echo "$0" | sed 's/\/'"$(basename "$0")"'//')"

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
