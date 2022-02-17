# $ZDOTDIR/aliases.zsh
#

command -v exa >/dev/null && alias ls='exa'
command -v nvim >/dev/null && alias vi='nvim'
alias v='vi'
alias tower='gittower'
alias lynx='lynx -vikeys'
alias lzg='lazygit'
alias lzd='lazydocker'

# Remove any existing TMUX aliases and set our own
tx_aliases=$(alias | grep tmux)
for a in $tx_aliases; do
	unalias $(echo $a | cut -d '=' -f 1)
done
alias txa='tmux attach -t'
alias txns='tmux new-session -s'
alias txls='tmux list-sessions'
alias txk='tmux kill-server'
alias tkss='tmux kill-session -t'

alias edkit='nvim ~/.config/kitty'
alias t='todo.sh'
