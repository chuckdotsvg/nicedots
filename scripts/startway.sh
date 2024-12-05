#!/bin/bash

# audio
playerctld daemon &

# status bar
waybar &
printf true > "$XDG_RUNTIME_DIR/keyboard.status"


# graphic stuff
swww init&
hypridle &
gammastep &
# xwaylandvideobridge &

dex -a -s ~/.config/autostart/
