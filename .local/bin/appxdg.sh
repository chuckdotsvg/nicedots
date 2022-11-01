#!/bin/bash

error(){
  dunstify "But nothing happened!"
  exit 1
}

test $XDG_SESSION_TYPE="wayland" && MENU="wofi --dmenu" || MENU="dmenu"
#APPS=$( ls {/usr,$HOME/.local}/share/applications/*.desktop | sed 's/.*share\/applications\///g' )
OPEN="/usr/share/mime/types"

TYPE=$(cat $OPEN | $MENU -p 'Insert a file extension:')

test $TYPE && grep $TYPE $OPEN || error

DEF=$(ls {/usr,$HOME/.local}/share/applications/*.desktop |\
  sed 's/.*share\/applications\///g' | $MENU -p 'Select default app:')

ls {/usr,$HOME/.local}/share/applications/*.desktop | sed 's/.*share\/applications\///g' | grep $DEF &&\
  xdg-mime default $DEF $TYPE &&\
  dunstify "Success!" "${DEF} now opens ${TYPE} files" || error
