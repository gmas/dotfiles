# For tramp et al., don't do anything fancy.
if [[ "$TERM" == "dumb"  ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
  return
fi

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
alias e='emacsclient -t'
alias emacsd='emacs --daemon'
source /usr/share/nvm/init-nvm.sh

#OSX
alias reset_dns="sudo killall -HUP mDNSResponder"

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
