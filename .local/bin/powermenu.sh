#!/bin/bash

test $XDG_SESSION_TYPE="wayland" && MENU="wofi --dmenu" || MENU="dmenu"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU -p "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
loginctl $OPT || dunstify "But nothing happened!"
