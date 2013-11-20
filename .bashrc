#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export TERM=xterm-256color
alias be='bundle exec'

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

export RUBIES=(
  ~/.rbenv/versions/*)

#export VDPAU_DRIVER=va_gl

#editor
export EDITOR='vim'
export GIT_EDITOR='vim'
