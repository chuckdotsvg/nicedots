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

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
