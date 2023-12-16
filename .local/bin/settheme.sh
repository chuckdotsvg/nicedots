#!/bin/sh

case "$1" in
    daytime) set -- "Latte" "Light"
    ;;
    *) set -- "Mocha" "Dark"
    ;;
esac

COLOUR=Lavender
ICON_THEME=Papirus-"$2"

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

# rofi
sed -i "s/catppuccin-.*/catppuccin-${1,,}\"/" .config/rofi/config.rasi

# alacritty
sed -i "0,/tokyonight_.*.yml/s//tokyonight_${2,,}.yml/" .config/alacritty/alacritty.yml | head -n20
