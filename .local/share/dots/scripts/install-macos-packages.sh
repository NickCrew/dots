#!/usr/bin/env zsh

# Install homebrew 
/bin/bash -c \
	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dev workstation packages
brew install \
	asdf \
	autoconf \
	automake \
	autossh \
	bat \
	byacc \
	bzip2 \
	coreutils \
	diff-so-fancy
	gawk \
	gcc \
	gh \
	gnu-sed \
	gnupg \
	howdoi \
	libevent \
	macvim \
	make \
    neovim \
    nodejs \
	pipx \
	pkg-config \
	pyenv \
	pyenv-virtualenv \
	pyenv-virtualenvwrapper \
	ranger \
    ripgrep \
	tldr \
	tmux \
	yamllint \
	zsh 


brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew tap homebrew/cask-fonts
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-fira-code-nerd-font


# Install rust and cargo packages
sh ~/.config/cfg/bootstrap.d/install-rust-tools.sh


