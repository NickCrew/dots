# $ZDOTDIR/exports.zsh
#

GPG_TTY=$(tty)
export GPG_TTY
export PAGER=less

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

if command -v nvim >/dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi


