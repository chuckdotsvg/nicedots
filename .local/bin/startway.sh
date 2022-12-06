#!/bin/bash

# audio
#pipewire &
#pipewire-pulse &
#wireplumber &
#playerctld daemon &
#mpd --no-daemon &
mpd-mpris &

# notifications
dunst &

# status bar
waybar &

# graphic stuff
swaybg -i ~/Pictures/flowerboy.jpg &
swayidle -w &
gammastep &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
