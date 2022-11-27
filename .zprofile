#
# ~/.bash_profile
#

# [[ -f ~/.bashrc ]] && . ~/.bashrc

# export PATH=$PATH:$HOME/.local/bin/
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# XDG Variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# tidy home
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export INPUTRC="$XDG_CONFIG_HOME"/shell/inputrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export ZDOTDIR="$HOME"/.config/zsh

# programs settings
export DIFFPROG="nvim -d"
export EDITOR=nvim
export GTK_USE_PORTAL=0
export XCURSOR_SIZE=24
export QT_QPA_PLATFORMTHEME=gtk3

# firefox
test "$XDG_SESSION_TYPE" = "wayland" && export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

export TERMINAL="kitty"
export MENU="wofi"

# for runit user services
export SVDIR=~/.service

# fake display manager
if [ -z "${DISPLAY}" ]; then
  case "${XDG_VTNR}" in
    1) exec dbus-launch --exit-with-session ssh-agent Hyprland ;;
    2) exec ssh-agent startx "$XINITRC" ;;
  esac
fi
