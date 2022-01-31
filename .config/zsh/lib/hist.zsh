# $ZDOTDIR/history.zsh
#

HISTSIZE=1000000
SAVEHIST=1000000
HISTIGNORE="pwd:ls:ll:la:.."
HISTCONTROL=ignoredups
setopt bang_hist
setopt append_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first


