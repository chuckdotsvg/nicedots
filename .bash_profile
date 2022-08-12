#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export PATH=$PATH:$HOME/scripts
export XKB_DEFAULT_LAYOUT=it
