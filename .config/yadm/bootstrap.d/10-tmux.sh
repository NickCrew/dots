#!/usr/bin/env zsh
set -e

OS="$(uname -s)"
PREFIX="${PREFIX:-$HOME/.local}"

# Install dependencies
deps() {
	if [[ $OS == "Darwin" ]]; then
		command -v brew >/dev/null || sh "$(dirname $BASH_SOURCE[0])/homebrew.sh"
		brew install \
			autoconf \
			automake \
			bison \
			bzip2 \
			libevent \
			ncurses \
			pkg-config \
			utf8proc \
			zlib 
	elif [[ $OS == "Ubuntu" ]]; then
		sudo apt-get update \
			&& sudo apt-get install -y \
			libevent-dev \
			ncurses-dev \
			build-essential \
			bison \
			pkg-config
	fi
}

# Compile
build() {
	mkdir -p ~/.local/share/man/man1 ~/.local/src
	cd ~/.local/src
	if [ -d tmux ]; then
		cd tmux && git pull
	else
		git clone https://github.com/tmux/tmux.git tmux && cd tmux 
	fi 
	sh autogen.sh 
	./configure --enable-utf8proc --prefix=${PREFIX}
	make && make install 
}

# Install plugin manager
plugins() {
	if [ ! -d $HOME/.tmux/plugins/tpm ]; then
		echo "Installing tmux plugin manager..."
		git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
	fi
}

deps
build
plugins
