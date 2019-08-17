#!/bin/bash

if [[ `ps -A | grep compton` ]]; then
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
fi

compton --config $HOME/.config/compton/config &
