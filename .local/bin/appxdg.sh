#!/bin/bash

error(){
  dunstify "But nothing happened!"
  exit 1
}


test $XDG_SESSION_TYPE = "wayland" && MENU="wofi --dmenu" || MENU="dmenu"
# MENU="dmenu" # TODO: ifs for menu declaration


IFS=$''

APPS=$( ls {/usr,$HOME/.local}/share/applications/*.desktop | sed 's/.*share\/applications\///g' )
OPEN="/usr/share/mime/types"

TYPE=$(cat $OPEN | IFS= $MENU -c -F -l 10 -bw 3 -p 'Insert a file extension:')

test $TYPE && grep $TYPE $OPEN || error

DEF=$(echo $APPS | IFS= $MENU -c -f -l 10 -bw 3 -p 'Select default app:')

echo $APPS | grep $DEF && xdg-mime default $DEF $TYPE &&\
  dunstify "Success!" "${DEF} now opens ${TYPE} files" || error
