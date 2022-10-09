#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# RUNIT SERVICES
sv_en(){ doas ln -s /etc/runit/sv/$1 /run/runit/service ; }
sv_dis(){ doas touch /run/runit/service/$1/down ; }
sv_rm(){ doas unlink /run/runit/service/$1 ; }

# PACMAN
alias upg='doas pacman -Syu'

# SYSTEM ALIASES
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias icons='lf /usr/share/icons'
alias ls='ls --color=auto --group-directories-first --classify --file-type'
alias pbin="curl -F 'f:1=<-' ix.io"
alias rm="echo Not today :D && false"

# GITHUB ALIASES
alias config='git --git-dir=$HOME/.nicedots --work-tree=$HOME'
alias gps='git push origin main'
alias gf='git fetch'
#alias grbs='git rebase'

#\PS1='[\u@\h \W]\$ '
PS1="\[\e[1;36m\]┌──[\[\e[31m\]\u\[\e[39m\]:\[\e[34m\]\h\[\e[33m\] \w\[\e[36m\]]\n\[\e[36m\]└─\[\e[35m\]»\[\e[0m\] "

# NICE COMMANDS
complete -cf doas
complete -cf man

neofetch
