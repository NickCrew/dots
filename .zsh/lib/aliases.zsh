# $ZDOTDIR/aliases.zsh
#

alias mv='mv -i'

alias v='vi'
alias tower='gittower'
alias lynx='lynx -vikeys'
alias lzg='lazygit'
alias lzd='lazydocker'


(( ${+commands[poetry]} )) && alias po=poetry && alias por='poetry run'
