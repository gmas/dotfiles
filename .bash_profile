
#chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh


#aliases
alias start_elasticsearch="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias start_redis="redis-server /usr/local/etc/redis.conf"
alias start_postgres="pg_ctl -D /usr/local/var/postgres -l logfile start"
alias start_memcached="/usr/local/opt/memcached/bin/memcached"
alias be="bundle exec"

#prompt
export PS1="\e[0;33m\u\e[m \w\$ "

export TERM="xterm-256color"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

