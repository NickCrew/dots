#!/usr/bin/env zsh

if ! command -v >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dev workstation packages
brew install \
    asdf \
    autoconf \
    automake \
    autossh \
    byacc \
    bzip2 \
    coreutils \
    diff-so-fancy
    gawk \
    gcc \
    gnu-sed \
    gnupg \
    howdoi \
    libevent \
    macvim \
    make \
    pkg-config \
    ranger \
    tldr \
    yamllint \
    zsh 

# Neovim
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install --HEAD neovim

# Nerdfonts
brew tap homebrew/cask-fonts
brew install --cask \
    font-sauce-code-pro-nerd-font \
    font-fira-code-nerd-font

