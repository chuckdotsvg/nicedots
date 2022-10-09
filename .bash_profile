#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# XDG Variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# tidy home
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export EDITOR=nvim
export GTK_USE_PORTAL=0
export PATH=$PATH:$HOME/.local/bin/
export RANGER_LOAD_DEFAULT_RC=FALSE
export XKB_DEFAULT_LAYOUT=it
export XCURSOR_SIZE=24

# export PF_INFO="ascii title os kernel shell uptime pkgs memory palette"
