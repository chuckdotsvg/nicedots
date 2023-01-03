#!/bin/bash

# audio
#pipewire &
#pipewire-pulse &
#wireplumber &
playerctld daemon &
#mpd --no-daemon &

# notifications
fnott &

# status bar
waybar &

# tray
nm-applet --indicator &
blueman-applet &

# graphic stuff
swaybg -i ~/Pictures/flowerboy.jpg &
swayidle -w &
gammastep &
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty &

# polkit agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
