# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"
export EDITOR="nano"
