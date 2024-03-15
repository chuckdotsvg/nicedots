#!/bin/bash

handle() {
  case $1 in
    windowtitle*)
        socat -U - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | read -r activewindow
        wintit=${activewindow#*2}
        if [ "$wintit" = "Extension(.*)Bitwarden(.*)" ]; then
            hyprctl dispatch togglefloating "title:$wintit"
        fi
        ;;
  esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
