# $ZDOTDIR/exports.zsh
#

GPG_TTY=$(tty)
export GPG_TTY

export PAGER=less

command -v nvim >/dev/null && \
	export EDITOR=nvim

command -v vimr >/dev/null && \
	export VISUAL=vimr

export FZF_COMPLETION_TRIGGER=';;'

export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=true
export MCFLY_RESULTS=25
export MCFLY_RESULTS_SORT=RANK  # RANK or LAST_RUN

export PYENV_VIRTUALENV_DISABLE_PROMPT=1


