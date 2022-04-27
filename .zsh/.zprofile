#
# .zprofile - Read after .zshenv for login shells only
# 

# autostart tmux if we're not on the workstation
if [[ -z "$TMUX" && `uname` != "Darwin" ]]; then
	tmux attach -t main || tmux new -s main
fi

export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="${HOME}/go"

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
