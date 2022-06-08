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


