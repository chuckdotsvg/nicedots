#!/bin/bash

STEP=5

case $1 in
	+|-)
		# Set the volume on (if it was muted)
        wpctl set-mute @DEFAULT_SINK@ 0
        wpctl set-volume @DEFAULT_SINK@ $STEP%$1
		;;
	muted)
        wpctl set-mute @DEFAULT_SINK@ toggle
        ;;
  *)
    echo "Incorrect invocation, I need at least an argument";
    exit 1
    ;;
esac

PERCENTAGE=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100}')

[ $PERCENTAGE -ge 0  ] && VOLUME="low"
[ $PERCENTAGE -gt 24 ] && VOLUME="medium"
[ $PERCENTAGE -gt 49 ] && VOLUME="high"
[ $PERCENTAGE -gt 74 ] && VOLUME="overamplified"
[ -z "$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $3}')" ] && VOLUME="muted"

notify-send "Volume $VOLUME: " -c "multimedial" -r "9993" -h int:value:"$PERCENTAGE" -i ~/Pictures/popcatpng/${VOLUME}.png
