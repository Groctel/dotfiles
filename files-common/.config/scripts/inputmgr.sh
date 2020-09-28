#!/bin/sh

operation="$1"
descriptor="$2"
shift
shift

device=$(\
	xinput list \
	| grep "$descriptor" \
	| awk '{print $6;}' \
	| sed 's/id=//' \
)

case "$operation" in
"set")
	xinput set-prop "$device" "$@"
;;
"toggle")
	status=$(\
		xinput list-props "$device" \
		| grep "Device Enabled" \
		| awk '{print $4;}'
	)
	xinput set-prop "$device" "Device Enabled" $((-status + 1));
;;
esac
