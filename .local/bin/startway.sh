#!/bin/bash

#systemctl --user import-environment XDG_CURRENT_DESKTOP WAYLAND_DISPLAY
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# audio
pipewire &
pipewire-pulse &
wireplumber &
playerctld daemon &
mpd &

# notifications
dunst &

# status bar
waybar &
udiskie &
blueman-applet &
nm-applet --indicator &

# graphic stuff
swaybg -i ~/Pictures/flowerboy.jpg &
swayidle -w &
gammastep-indicator -m wayland &

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
