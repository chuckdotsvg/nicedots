#!/bin/bash

# audio
playerctld daemon &

# status bar
waybar &

# graphic stuff
swww init&
swayidle -w &
gammastep &
# xwaylandvideobridge &

dex -a -s ~/.config/autostart/
