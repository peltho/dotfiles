#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias vi='vim'
alias ncm='ncmpcpp'
alias startedsvc='systemctl list-unit-files | grep enabled'
alias vpn='openvpn3 session-start --config ~/client.ovpn'
alias vpn1='sudo openvpn --config ~/client.ovpn --daemon'
alias cr='vim ~/CR/$(date -Idate)_cr.md'
alias ya='yaourt'
alias tz='echo -n "Los Angeles: "; env TZ=America/Los_Angeles date'
alias qpn='openvpn3 session-manage -D --config ~/client.ovpn'
alias tunnel='(cd /home/thomas/dev/api.video/environment && sh /home/thomas/dev/api.video/environment/tunnel)'
#PS1='[\u@\h \W]\$ '

[ -n "$PS1" ] && source ~/.bash_prompt

# To apply wal (pywal) to new terminals
(cat ~/.cache/wal/sequences &)


source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Android SDK 
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/go/bin

# Docker rootless
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/thomas/Android/Sdk/emulator:/home/thomas/Android/Sdk/tools:/home/thomas/Android/Sdk/tools/bin:/home/thomas/Android/Sdk/platform-tools:/home/thomas/go/bin
