#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ -d ~/bin ] && { PATH="${HOME}/bin:${PATH}"; }
export PATH

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
