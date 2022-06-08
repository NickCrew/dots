#
# .zprofile - Read after .zshenv for login shells only
# 

# autostart tmux if we're not on the workstation
if [[ -z "$TMUX" && `uname` != "Darwin" ]]; then
	tmux attach -t main || tmux new -s main
fi

export ZSH_CACHE_DIR="${HOME}/.cache/zsh"  # Used by several OMZ plugins
export ZSH_RC_BOOTSTRAP="${ZDOTDIR}/lib/init.zsh"
export PROFILE_ZSH=${PROFILE_ZSH:-0}

export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="${HOME}/go"
export NVM_DIR="${HOME}/.nvm"
GPG_TTY=$(tty)
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export EDITOR=vi
export GPG_TTY
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export PAGER=less
export FZF_COMPLETION_TRIGGER=';;'

path=("$HOME/.local/bin" $path)
path=("${HOME}/Applications" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)
path=("$HOME/.poetry/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("${GOPATH}/bin" $path)

export PATH
typeset -U PATH

test -e "${ZDOTDIR}/.secrets.zsh" && source "${ZDOTDIR}/.secrets.zsh"

eval "$(pyenv init --path)"
