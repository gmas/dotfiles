source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle rails
antigen bundle bundler

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme lambda
#antigen theme cloud
antigen theme simple

# Tell antigen that you're done.
antigen apply

source /usr/local/share/chruby/chruby.sh
#RUBIES=(
#  ~/.rbenv/versions/*)
source /usr/local/share/chruby/auto.sh

export EDITOR='vim'
export GIT_EDITOR='vim'
export BUNDLER_EDITOR='vim'

#GO lang config
export GOPATH=~/play/golang
export PATH=$PATH:~/play/golang/bin

export PATH=~/bin:$PATH
eval $(ssh-agent)

alias tmux="tmux -2"
source /usr/share/nvm/init-nvm.sh

#OSX
alias reset_dns="sudo killall -HUP mDNSResponder"
