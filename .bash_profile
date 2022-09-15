#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# for XDG_RUNTIME_DIR
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

export EDITOR=nvim
export GTK_USE_PORTAL=0
export MOZ_ENABLE_WAYLAND=1
export PATH=$PATH:$HOME/scripts
export XKB_DEFAULT_LAYOUT=it
export XCURSOR_SIZE=24

export PF_INFO="ascii title os kernel shell uptime pkgs memory palette"
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
