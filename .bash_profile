if [ -f `brew --prefix`/etc/bash_completion ]; then
	  . `brew --prefix`/etc/bash_completion
	  fi
export PS1="\e[0;33m\u\e[m \w\$ "
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/node/bin:$PATH
