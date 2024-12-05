#!/bin/sh

test -z "$1" && set -- "$(cat /sys/class/power_supply/AC/online)"

export DBUS_SESSION_BUS_ADDRESS=/run/user/1000/
HIS=$(hyprctl instances -j | jq -r '.[].instance')

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    export HYPRLAND_INSTANCE_SIGNATURE="$HIS"
fi

hyprctl keyword decoration:drop_shadow "$1"
hyprctl keyword decoration:blur:enabled "$1"
hyprctl keyword animations:enabled "$1"
