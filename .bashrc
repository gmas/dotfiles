#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
alias be='bundle exec'
alias ls='ls --color=auto'

source /usr/local/share/chruby/chruby.sh

export TERM=screen-256color
#export TERM=xterm-256color

#editor
export EDITOR='vim'
export GIT_EDITOR='vim'
BUNDLER_EDITOR='vim'
