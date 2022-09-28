#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# temporary wm commands
# alias dwl='XDG_CURRENT_DESKTOP=dwl dbus-run-session dwl -s "startway.sh"'
# alias sway='XDG_CURRENT_DESKTOP=sway dbus-run-session sway'
# alias Hyprland='dbus-run-session Hyprland'

# PACMAN
alias upg='doas pacman -Syu'

# SYSTEM ALIASES
alias diff='diff --color=auto'
alias grep='grep --color=auto'
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
