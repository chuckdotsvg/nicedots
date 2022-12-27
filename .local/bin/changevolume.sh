#!/bin/bash

PERCENTAGE=$(pamixer --get-volume)
STEP=5

case $1 in
	high)
		# Set the volume on (if it was muted)
    pamixer -u
    pamixer -i $STEP
		;;
	low)
		# Set the volume on (if it was muted)
    pamixer -u
    pamixer -d $STEP
		;;
	muted)
	  pamixer -t ;;
  *)
    echo "Incorrect invocation, I need at least an argument";
    exit 1
    ;;
esac

PERCENTAGE=$(pamixer --get-volume)

[ $PERCENTAGE -ge 0  ] && VOLUME="low"
[ $PERCENTAGE -gt 24 ] && VOLUME="medium"
[ $PERCENTAGE -gt 49 ] && VOLUME="high"
[ $PERCENTAGE -gt 74 ] && VOLUME="overamplified"
$(pamixer --get-mute) && VOLUME="muted"

notify-send "Volume $VOLUME: ${PERCENTAGE}%" -c "multimedial" -r "9993" -h int:value:"$PERCENTAGE" -i ~/Pictures/popcatpng/${VOLUME}.png
