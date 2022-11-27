#!/bin/bash

error(){
  dunstify "But nothing happened!"
  exit 1
}

test "$XDG_SESSION_TYPE" = "wayland" && MENU="fuzzel -d" || MENU="dmenu -c -F -l 10 -bw 3"

APPS="ls /usr/share/applications/"
OPEN="/usr/share/mime/types"

TYPE=$(cat $OPEN | $MENU -p 'Insert a file extension:')

test $TYPE && grep $TYPE $OPEN || error

DEF=$($APPS | $MENU -p 'Select default app:')

$APPS | grep $DEF && xdg-mime default $DEF $TYPE &&\
  dunstify "Success!" "${DEF} now opens ${TYPE} files" || error
