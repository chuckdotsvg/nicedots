#!/bin/bash

# audio
playerctld daemon &

# status bar
waybar &

# graphic stuff
swww init&
hypridle &
gammastep &
# xwaylandvideobridge &

dex -a -s ~/.config/autostart/
