(( ${+commands[nvim]} )) || return

alias vi='nvim'
export EDITOR=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
