# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install


# The following lines were added by compinstall

zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/chuck/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.

# End of lines added by compinstall

autoload -U colors && colors


# keybindings
# bindkey '^[[5~' delete-char
# bindkey '^[[5~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char


compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
