# Runs before .zshrc 

OS=$(uname -s)

# Created by `pipx` on 2023-04-28 22:47:34
GOPATH="${GOPATH:-$HOME/opt/go}"
PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"

path=("/usr/local/sbin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/Applications" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("${GOPATH:-$HOME/opt/go}/bin" $path)
path=("$PYENV_ROOT/bin" $path)

if [[ $OS = 'Darwin' ]]; then
	path=("/Applications/WezTerm.app/Contents/MacOS" $path)
fi

export PYENV_ROOT
export GOPATH
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"

