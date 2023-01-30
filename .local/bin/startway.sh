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
swaybg -i ~/Pictures/space.jpg &
swayidle -w &
gammastep &

~/.config/systemd/user/hotkeys.sh &

# polkit agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
