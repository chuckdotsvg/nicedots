#!/bin/bash

# test '$XDG_CURRENT_DESKTOP = "{dwl,Hyprland}"' && MENU="wofi -d" || MENU="dmenu"
MENU="dmenu -R"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU -p "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
systemctl $OPT || dunstify "But nothing happened!"
