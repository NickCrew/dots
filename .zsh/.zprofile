# Runs before .zshrc 


if [[ $(uname -s) = 'Darwin' ]]; then 
	if [[ $(uname -m) = "x86_64" ]]; then
		eval "$(/usr/local/HomeBrew/bin/brew shellenv)"
	else
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
fi

if command -v go >/dev/null; then
	export GOPATH="${GOPATH:-$HOME/opt/go}"
	export PATH="${PATH}:${GOPATH}"
fi

if command -v pyenv >/dev/null; then
	export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
	export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

