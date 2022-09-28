#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# for XDG_RUNTIME_DIR
# if test -z "${XDG_RUNTIME_DIR}"; then
#   export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
#   if ! test -d "${XDG_RUNTIME_DIR}"; then
#     mkdir "${XDG_RUNTIME_DIR}"
#     chmod 0700 "${XDG_RUNTIME_DIR}"
#   fi
# fi
# 
# # ssh-agent
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

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

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR=nvim
export GTK_USE_PORTAL=0
export PATH=$PATH:$HOME/.local/bin/
export XKB_DEFAULT_LAYOUT=it
export XCURSOR_SIZE=24

# export PF_INFO="ascii title os kernel shell uptime pkgs memory palette"
export BEMENU_OPTS="--list 7 \
  --fn 'JetBrains Mono 12'\
  --tb '#ff79c6'\
  --tf '#000000'\
  --fb '#282a36'\
  --ff '#f8f8f2'\
  --nb '#282a36'\
  --nf '#6272a4'\
  --hb '#44475a'\
  --hf '#50fa7b'\
  --sb '#44475a'\
  --sf '#50fa7b'\
  --scb '#282a36'\
  --scf '#ff79c6'"

# END: display manager (fu systemd)
