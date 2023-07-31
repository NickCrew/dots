#!/bin/bash

OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
	xcode-select --install
	# install homebrew if it's missing
	if ! command -v brew >/dev/null 2>&1; then
		echo "Installing homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	  fi

	brew install \
		mas \
		terminal-notifier \
		pygments


	brew tap epk/epk
	brew install --cask font-sf-mono-nerd-font
fi
