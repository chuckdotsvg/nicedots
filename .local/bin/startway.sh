#!/bin/bash

#systemctl --user import-environment XDG_CURRENT_DESKTOP WAYLAND_DISPLAY

# killall pipewire; killall pipewire-pulse; killall wireplumber; pipewire & pipewire & pipewire-pulse & wireplumber &

# status bar
waybar &
# eww daemon &
# eww open bar &

swaybg -i ~/Pictures/forest-hut.png &
dunst &
udiskie &
swayidle -w &
wlsunset -l 41.9 -L 12.5 &
playerctld daemon &

# dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# killall swhks; swhks &
# pkexec swhkd -c ~/.config/swhkd/swhkdrc

# exec <&-
