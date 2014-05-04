#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#export TERM=xterm-256color
export TERM=screen-256color
alias be='bundle exec'
alias ssh="ssh -A"

source /usr/local/share/chruby/chruby.sh

#RUBIES=(
#  ~/.rbenv/versions/*)

source /usr/local/share/chruby/auto.sh

#export VDPAU_DRIVER=va_gl

#editor
export EDITOR='vim'
export GIT_EDITOR='vim'
BUNDLER_EDITOR='vim'

source ~/dotfiles/.bash-git-prompt/gitprompt.sh

[ -s "/home/gmas/.nvm/nvm.sh" ] && . "/home/gmas/.nvm/nvm.sh" # This loads nvm
eval $(ssh-agent)
