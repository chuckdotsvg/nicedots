#!/bin/bash

#systemctl --user import-environment XDG_CURRENT_DESKTOP WAYLAND_DISPLAY

# audio
pipewire &
pipewire-pulse &
wireplumber &
playerctld daemon &

# notifications
dunst &

# status bar
waybar &
udiskie &
blueman-applet &
nm-applet &

# graphic stuff
swaybg -i ~/Pictures/forest-hut.png &
swayidle -w &
gammastep &

# dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc
