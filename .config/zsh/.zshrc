# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U colors && colors	# Load colors
autoload -Uz vcs_info

setopt PROMPT_SUBST
precmd() { vcs_info }

# colors as prompt don't work
zstyle ':vcs_info:git:*' formats 'on %F{09} %b%f' # 09 stands fo red and so on

PROMPT=$'%B%{$fg[magenta]%}%n%{$reset_color%}%b in %B%{$fg[cyan]%}${PWD/#$HOME/~}%f%b %{$reset_color%}${vcs_info_msg_0_}\n%% '

# The following lines were added by compinstall

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _expand _list _oldlist
zstyle :compinstall filename '/home/chuck/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.

# End of lines added by compinstall

setopt correct_all # enable correction like arch iso

# keybindings
# bindkey '^[[5~' delete-char
# bindkey '^[[5~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# update command completion on installation


zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

notify_precmd() {
  emulate -L zsh  # Reset shell options inside this function.

  # Fetch the last command with elapsed time from history:
  local -a stats=( "${=$(fc -Dl -1)}" )
  # = splits the string into an array of words.
  # The elapsed time is the second word in the array.

  local -a time=( "${(s.:.)stats[3]}" )

  # check if take more than 1 minute
  # (( time[-2] > 0 || ${#arr[@]} > 2 )) && 
  #     notify-send -u critical \
  #         "hey command '$stats[4,-1]' executed in ${stats[3]}"

  RPROMPT="Executed in ${stats[3]}"
}

add-zsh-hook -Uz precmd notify_precmd

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# conda
# [[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'
