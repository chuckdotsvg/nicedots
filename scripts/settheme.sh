#!/bin/bash

case "$1" in
    daytime) set -- "Latte" "Light"
    ;;
    *) set -- "Mocha" "Dark"
    ;;
esac

COLOUR=Lavender
CURSOR_THEME="capitaine-cursors-${1,,}"

# hyprland stuff
if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
    # cursor
    hyprctl setcursor "$CURSOR_THEME" 24

    # change hyprland colors
    unlink "$HOME"/.config/hypr/catppuccin.conf
    ln -s "$HOME"/.config/hypr/"${1,,}".conf "$HOME"/.config/hypr/catppuccin.conf
    hyprctl reload
fi

# GTK3 theme
mkdir -p "$HOME"/.local/share/nwg-look/themes
unlink "$HOME"/.local/share/nwg-look/gsettings
ln -s "$HOME"/.local/share/nwg-look/themes/"$2" "$HOME"/.local/share/nwg-look/gsettings
nwg-look -a

# GTK4 theme
THEME_DIR=/usr/share/themes/Catppuccin-$1-Standard-$COLOUR-$2/

unlink "${HOME}/.config/gtk-4.0/assets"
unlink "${HOME}/.config/gtk-4.0/gtk.css"
unlink "${HOME}/.config/gtk-4.0/gtk-dark.css"

mkdir -p "${HOME}/.config/gtk-4.0"
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# rofi
sed -i "s/catppuccin-.*/catppuccin-${1,,}\"/" ~/.config/rofi/config.rasi

# alacritty
# sed -i "s/catppuccin_.*\.toml/catppuccin_${1,,}\.toml/" ~/.config/alacritty/alacritty.toml

# spotify
~/scripts/update_spotify.sh "$1" "$2" &

# waybar
ln -sf "$HOME/.config/waybar/${2,,}-style.css" "$HOME/.config/waybar/style.css"
pidof waybar && killall -SIGUSR2 waybar || waybar

# mako
makoctl mode -s "${2,,}"

# qt (theme only)
kvantummanager --set "catppuccin-${1,,}-${COLOUR,,}"

# betterdiscord
# sed -i "s/catppuccin-.*-/catppuccin-${1,,}-/" ~/.config/BetterDiscord/data/stable/custom.css

#wallpaper
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_POS=bottom
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_DURATION=2

MONS=$(swww query | awk '{print $1}' | sed 's/:$/,/' | tr -d '\n')
swww img -o "$MONS" ~/Pictures/"${2,,}".jpg
