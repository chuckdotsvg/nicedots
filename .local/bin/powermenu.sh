#!/bin/bash

test $XDG_SESSION_TYPE = "wayland" && MENU="wofi -d" || MENU="dmenu -c -F -l 10 -bw 3"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU --prompt "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
$OPT || dunstify "But nothing happened!"
