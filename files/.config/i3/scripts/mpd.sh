#!/bin/sh

# ==============================================================================
# GROCTEL'S MPD HANDLER FOR I3WM
# ------------------------------------------------------------------------------
# Opens and closes ncmpcpp and handles that only one instance of mpd is open
# every time.
# This script is designed to be run from an keysym.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String : "init" to start mpd with ncmpcpp and "kill" to terminate it
# - $2 -> String : Terminal emulator to open ncmpcpp with
# ==============================================================================

if [ "$1" = "init" ]; then
	pgrep mpd$ || mpd;
	pgrep mpd_discord || mpd_discord_richpresence --fork;

	"$2" ncmpcpp &

elif [ "$1" = "kill" ]; then
	killall -q mpd;
	killall -q mpd_discord_richpresence;
	killall -q ncmpcpp;
fi
