#!/bin/bash
mon1="eDP-1" # Primary monitor
mon2="HDMI-A-1" # Secondary
ws_limit=4 # how many workspaces on the primary monitor
 
handleworkspaces() {
    if [[ ${1:0:16} == "createworkspace>" ]]; then
        ws=$(( ${1:17:19} ))
        if (( $((ws <= ws_limit)) )); then
            hyprctl dispatch moveworkspacetomonitor "$ws $mon1"
        else
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2"
        fi
    elif [[ ${1:0:10} == "workspace>" ]]; then
        ws=$(( ${1:11:13} ))
        if (( $((ws <= ws_limit)) )); then
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon1"
        else
            hyprctl dispatch moveworkspacetomonitor  "$ws $mon2"
        fi
    fi
}
 
socat - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handleworkspaces "$line"; done
