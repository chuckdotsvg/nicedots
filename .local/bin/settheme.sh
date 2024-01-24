#!/bin/bash

case "$1" in
    daytime) set -- "Latte" "Light"
    ;;
    *) set -- "Mocha" "Dark"
    ;;
esac

COLOUR=Lavender
ICON_THEME=Papirus-"$2"
CURSOR_THEME="capitaine-cursors"

[[ "$2" = "Dark" ]] && CURSOR_THEME="$CURSOR_THEME-light"

THEME_DIR=/usr/share/themes/Catppuccin-$1-Standard-$COLOUR-$2/

unlink "${HOME}/.config/gtk-4.0/assets"
unlink "${HOME}/.config/gtk-4.0/gtk.css"
unlink "${HOME}/.config/gtk-4.0/gtk-dark.css"

mkdir -p "${HOME}/.config/gtk-4.0"
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# GTK3 theme
gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-"$1"-Standard-"$COLOUR"-"$2"

gsettings set org.gnome.desktop.interface color-scheme prefer-"${2,,}"
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"

# cursor
# gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
# hyprctl setcursor "$CURSOR_THEME" 24

# rofi
sed -i "s/catppuccin-.*/catppuccin-${1,,}\"/" .config/rofi/config.rasi

# alacritty
sed -i "s/catppuccin_.*\.toml/catppuccin_${1,,}\.toml/" ~/.config/alacritty/alacritty.toml

# kitty
# kitty kitten themes "Catppuccin-$1"

# waybar
killall waybar 
waybar --style "$HOME/.config/waybar/${2,,}-style.css" &> /dev/null &

# qt (theme only)
kvantummanager --set "Catppuccin-Mocha-Lavender"

# mako
makoctl mode -s "${2,,}"

# betterdiscord
sed -i "s/catppuccin-.*-/catppuccin-${1,,}-/" ~/.config/BetterDiscord/data/stable/custom.css

#wallpaper
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_POS=bottom
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_DURATION=2

swww img ~/Pictures/flowerboy-"${2,,}".jpg
