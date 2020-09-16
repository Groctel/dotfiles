#!/bin/sh

# ==============================================================================
# GROCTEL'S MPD HANDLER FOR I3WM
# ------------------------------------------------------------------------------
# Opens and closes ncmpcpp and handles that only one instance of mpd is open
# every time.
# This script is designed to be run from an keysym.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String : Which action to execute, commented before each line
# - $2 -> String : Terminal emulator to open ncmpcpp with
# ==============================================================================

case "$1" in
# Clear the track queue
	"clear")
		mpc clear;
	;;

# Start the music player daemon
	"init")
		pgrep mpd$ || mpd;
		pgrep mpd_discord || mpd_discord_richpresence --fork;

		"$2" -e ncmpcpp &
	;;

# Seek forward 5 seconds
	"fwd")
		mpc seek "+00:00:05"
	;;

# Kill the player daemon and all the player interface instances
	"kill")
		killall -q mpd;
		killall -q mpd_discord_richpresence;
		killall -q ncmpcpp;
	;;

# Advance to the next track
	"next")
		mpc next;
	;;

# Start playing the playlist from the first track
	"play")
		mpc play;
	;;

# Return to the previous track
	"prev")
		mpc prev;
	;;

# Rewind to the beginning of the current track
	"restart")
		mpc seek "0%"
	;;

# Seek backwards 5 seconds
	"rwd")
		mpc seek "-00:00:05"
	;;

# Play/Pause the player, calls init if it's not up
	"toggle")
		if pgrep mpd$; then
			mpc toggle;
		else
			pgrep mpd$ || mpd;
			pgrep mpd_discord || mpd_discord_richpresence --fork;

			(mpc status | grep playing) || mpc toggle;
		fi
	;;

# Turn the music player daemon's volume up by 5%
	"volup")
		mpc volume +5;
	;;

# Turn the music player daemon's volume down by 5%
	"voldown")
		mpc volume -5;
	;;
esac
