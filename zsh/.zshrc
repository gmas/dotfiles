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

setopt autocd
setopt cdablevars
# set cdable vars
export src=~/src
export play=~/play
export dotfiles=~/dotfiles
export work=~/work
export nas=~/nas
export downloads=~/Downloads

#source /usr/share/zsh/share/antigen.zsh
source ~/dotfiles/zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle rails
#antigen bundle bundler
#antigen bundle nojhan/liquidprompt

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# FZF is garbage
export FZF_CTRL_T_OPTS='--height=60% --layout=reverse --border --preview "bat --style=numbers --color=always {}" --preview-window=right:80%:wrap:nohidden --bind "ctrl-y:preview-up,ctrl-e:preview-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down"'
antigen bundle unixorn/fzf-zsh-plugin@main

ZSH_THEME=""
fpath+=$HOME/dotfiles/zsh/pure
autoload -U promptinit; promptinit
RPROMPT='%m% '
prompt pure
#PROMPT='%m{white}%* '$PROMPT

# Tell antigen that you're done.
antigen apply
export FZF_CTRL_T_COMMAND='=rg --files --hidden --glob "!{.git,node_modules}/**" --no-messages'

if [ -e /usr/share/chruby ]
then
  echo "found chruby. sourcing it..."
  source /usr/share/chruby/chruby.sh
  RUBIES=(
    ~/.rubies/*)
  source /usr/share/chruby/auto.sh
fi

export EDITOR='vim'
export GIT_EDITOR='vim'
export BUNDLER_EDITOR='vim'

#GO lang config
export GOPATH=~/play/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

export PATH=~/dotfiles/scripts/scripts/:~/bin:$PATH
 if [ -z $SSH_AGENT_PID ] ; then eval $(ssh-agent) ; fi

alias weechat="TZ='US/Pacific' TERM=screen-256color weechat-curses"
alias tmux="tmux -2"

# Forego alias to work with RAILS_ENV
forego_with_env() {
    if [ $1 != "run" ]
    then
        forego "$@"
        return 0
    else
        RUN_CMD="run"
        if [ -n "$RAILS_ENV" ]
        then
            RUN_CMD+=" -e=.env.$RAILS_ENV "
        fi

        RUN_CMD+=" ${@:2}"
        set -x
        forego $(echo "$RUN_CMD")
    fi
}
alias forego=forego_with_env

export NVM_DIR="/home/gmas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#OSX
alias reset_dns="sudo killall -HUP mDNSResponder"

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

export PATH="/usr/local/heroku/bin:$PATH"

# emacs
alias emacsd='emacs --daemon'
alias e='emacsclient -n'
alias et='emacsclient -t'
# sudo edit with emacs
alias E="SUDO_EDITOR=\"emacsclient -c -a emacs\" sudoedit"
alias ET="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"

# add SSH keys
alias ssh-add-keys="ssh-add ~/.ssh/*.pem && ssh-add"

export CDPATH=~/work:$CDPATH
#Homebrew
export PATH=/usr/local/bin:$PATH

# OSX specific
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  # proper GOROOT so that go-mode works
  export GOROOT=/usr/local/Cellar/go/1.13.4/libexec
  # zsh-completion
  fpath=(/usr/local/share/zsh-completions $fpath)
  # use Homebrew Emacs app
  alias emacsd='/usr/local/bin/emacs --daemon'
  alias e='/usr/local/bin/emacsclient -n'
  NVM_SCRIPT=/usr/share/nvm/init-nvm.sh
  if [[ -f NVM_SCRIPT ]]; then
    echo "NVM found. Sourcing ..."
    source $NVM_SCRIPT
  fi
fi

# kubectl aliases
alias k=kubectl
alias kd='kubectl describe'
alias kg='kubectl get'
alias klo='kubectl logs'
alias kc=kubecolor
alias ktx=kubectx

source ~/dotfiles/scripts/functions.bash

# npm
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH=~/.npm-global/bin:$PATH


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# distrobox
export PATH="/home/gmas/.local/bin:$PATH"

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
  export PATH="$(brew --prefix openssh)/bin:$PATH"
fi
