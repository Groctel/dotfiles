#!/bin/sh

action="$1"
terminal="$2"

StartMPD ()
{
	pgrep mpd$ || mpd
	pgrep mpd_discord || mpd_discord_richpresence --fork
}

case "$action" in
"clear")
	mpc clear
;;
"init")
	StartMPD
	"$terminal" -e ncmpcpp &
;;
"fwd")
	mpc seek "+00:00:05"
;;
"kill")
	killall -q mpd
	killall -q mpd_discord_richpresence
	killall -q ncmpcpp
;;
"next")
	mpc next
;;
"play")
	mpc play
;;
"prev")
	mpc prev
;;
"restart")
	mpc seek "0%"
;;
"rwd")
	mpc seek "-00:00:05"
;;
"toggle")
	mpc toggle || {
		StartMPD
		(mpc status | grep playing) || mpc toggle
	}
;;
"volup")
	mpc volume +5
;;
"voldown")
	mpc volume -5
;;
esac
