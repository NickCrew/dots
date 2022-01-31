#
# .zprofile - Read after .zshenv for login shells only
# 

# autostart tmux if we're not on the workstation
if [[ -z "$TMUX" && `uname` != "Darwin" ]]; then
	tmux attach -t main || tmux new -s main
else
    # macos specific settings
    if [[ -d "${HOME}/Applications" ]]; then
        path=("${HOME}/Applications" $path)
    fi
fi

# set the usual paths
path=("$HOME/.local/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)

# initialize pyenv
if command -v pyenv >/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    path=("$PYENV_ROOT/bin" $path)
    eval "$(pyenv init --path)"
fi

# initialize rust
[[ -d "${HOME}/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path)

# initialize golang
export GOPATH="${HOME}/go"
path=("${GOPATH}/bin" $path)

# export the path and remove dupes
export PATH
typeset -U PATH
