source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle rails
antigen bundle bundler
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme lambda

# Tell antigen that you're done.
antigen apply

export TERM=screen-256color
source /usr/local/share/chruby/chruby.sh
#RUBIES=(
#  ~/.rbenv/versions/*)
source /usr/local/share/chruby/auto.sh

export EDITOR='vim'
export GIT_EDITOR='vim'
BUNDLER_EDITOR='vim'

eval $(ssh-agent)
