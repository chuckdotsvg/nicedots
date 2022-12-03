#!/bin/bash

test $XDG_SESSION_TYPE = "wayland" && MENU="tofi" || MENU="dmenu -c -F -l 10 -bw 3"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU --prompt "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
loginctl $OPT || dunstify "But nothing happened!"
