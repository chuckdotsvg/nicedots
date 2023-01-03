#!/bin/bash

#test "$XDG_SESSION_TYPE" = "wayland" && MENU="fuzzel -d" || MENU="dmenu -c -F -l 10 -bw 3"
MENU="fuzzel -d --prompt"

appsdir="/usr/share/applications"
typesfile="/usr/share/mime/types"

error(){
  notify-send "But nothing happened!"
  exit 1
}

NEW=$( $MENU "Insert a file extension: " < "$typesfile" )

[ "$NEW" ] && grep "$NEW" "$typesfile" || error

DEF=$( "$appsdir" -printf '%P\n' | $MENU "Select default app: " )

if [ -e "${appsdir}/${DEF}" ]; then
    xdg-mime default "$DEF" "$NEW"
    notify-send "Success!" "${DEF} now opens ${NEW} files"
else
    error
fi
