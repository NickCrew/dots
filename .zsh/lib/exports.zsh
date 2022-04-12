# $ZDOTDIR/exports.zsh
#
GPG_TTY=$(tty)
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export EDITOR=vi
export GPG_TTY
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export PAGER=less
export FZF_COMPLETION_TRIGGER=';;'
