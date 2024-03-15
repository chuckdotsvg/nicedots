#!/bin/bash

MENU="rofi -dmenu"

OPT=$(echo -e 'poweroff\nreboot\nsuspend' | $MENU -p "Choose an option:")

# loginctl $OPT || dunstify "But nothing happened!"
$OPT || dunstify "But nothing happened!"
