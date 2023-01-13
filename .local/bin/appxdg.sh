#!/bin/bash

test "$XDG_SESSION_TYPE" = "wayland" && MENU="fuzzel -d" || MENU="dmenu"

appsdir="/usr/share/applications"
typesfile="/usr/share/mime/types"

error(){
  notify-send "But nothing happened!"
  exit 1
}

NEW=$( $MENU "Insert a file extension: " < "$typesfile" )

[ "$NEW" ] && grep "$NEW" "$typesfile" || error

DEF=$( find "$appsdir" -printf '%P\n' | $MENU "Select default app: " )

test "$DEF" || error

if [ -e "${appsdir}/${DEF}" ]; then
    xdg-mime default "$DEF" "$NEW"
    notify-send "Success!" "${DEF} now opens ${NEW} files"
else
    error
fi
