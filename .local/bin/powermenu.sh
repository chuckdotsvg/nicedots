#!/bin/bash

test "$XDG_SESSION_TYPE" = "wayland" && MENU="fuzzel -d" || MENU="rofi -dmenu"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU --prompt "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
$OPT || dunstify "But nothing happened!"
