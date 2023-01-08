#!/bin/bash

# audio
#pipewire &
#pipewire-pulse &
#wireplumber &
playerctld daemon &
#mpd --no-daemon &

# status bar
waybar &

# tray
nm-applet --indicator &
blueman-applet &

# graphic stuff
swaybg -i ~/Pictures/flowerboy.jpg &
swayidle -w &
gammastep &

# polkit agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
