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

echo "TERM WAS $TERM"

if [ "$TERM" = "xterm" ]
  then
    #xterm starts
    echo "XTERM"
    export TERM=xterm-256color
  else
    echo "TMUX"
    export TERM=screen-256color
fi
echo "TERM IS $TERM"

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
