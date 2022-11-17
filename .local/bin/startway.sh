#!/bin/bash

# audio
pipewire &
pipewire-pulse &
wireplumber &
playerctld daemon &
mpd &
mpDris2 &

# notifications
dunst &

# status bar
waybar &
blueman-applet &
nm-applet --indicator &

# graphic stuff
swaybg -i ~/Pictures/flowerboy.jpg &
swayidle -w &
gammastep-indicator -m wayland &

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
