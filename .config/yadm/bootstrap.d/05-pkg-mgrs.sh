#!/bin/bash

OS=$(uname -s)
#
# Install brew and ansible
# 
if [ "$OS" = "Darwin" ]; then
	xcode-select --install
	# install homebrew if it's missing
	if ! command -v brew >/dev/null 2>&1; then
		echo "Installing homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	  fi

	brew install ansible
fi

#
# Install Rust
# 
if ! command -v cargo >/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

#
# Install Node
#
if ! command -v node >/dev/null; then
	if ! command -v nvm >dev/null; then
		PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
	fi
	nvm install node
fi
