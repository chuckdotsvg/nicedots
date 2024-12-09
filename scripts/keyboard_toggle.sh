#!/usr/bin/env bash

export STATUS_FILE="/tmp/keyboard.status"

toggle_keyboard() {
    # waybar part
    CURPERC=$(tail -n 1 $STATUS_FILE | jq '.percentage')
    NEWPERC=$((((CURPERC / 100) + 1) % 2))
    [ $NEWPERC -eq 0 ] && NEWSTAT=disabled || NEWSTAT=enabled
    echo "{\"class\": \"${NEWSTAT}\", \"percentage\": $((NEWPERC * 100))}" >> "$STATUS_FILE"

    # functional part
    notify-send -u normal -c multimedial "keyboard $NEWSTAT"
    hyprctl keyword '$LAPTOP_KB_ENABLED' $NEWPERC -r
}

if ! [ -s "$STATUS_FILE" ]; then
    echo "{\"class\": \"enabled\", \"percentage\": 100}" >> "$STATUS_FILE"
else
    toggle_keyboard
fi

