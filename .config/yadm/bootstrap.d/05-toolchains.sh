#!/bin/bash

OS=$(uname -s)
PYVERSION=${PYVERSION:-3.11.4}

# Using Ansible for Docker Registry Load Testing
#
function install_toolchain_brew() {
  if [ "$OS" = "Darwin" ]; then
      xcode-select --install
      # install homebrew if it's missing
      if ! command -v brew >/dev/null 2>&1; then
          echo "Installing homebrew"
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      fi
  fi
}

function install_brew_packages() {
  brew install \
    ansible \
    ansible-lint \
    autoconf \
    automake \
    aws-iam-authenticator \
    jq \ 
    k9s \
    kube-linter \ 
    kubectl \ 
    kubectx \
    luarocks \
    nvm \
    pipx \ 
    pkg-config
    pyenv \
    pyenv-virtualenv \
    pyenv-virtualenvwrapper \
    tree-sitter \
    yadm 

}

function install_toolchain_rust () {
  if ! command -v cargo >/dev/null; then
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  source ~/.cargo/env
  cargo install \
    broot \
    exa \
    fd-find \
    mcfly \
    ripgrep \
    zoxide 
}

function install_toolchain_node() {
  if (( ! $+commands[node] )); then
    if (( ! $+commands[nvm] )); then
		PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
	fi
	nvm install node
  fi
}

function install_toolchain_python() {
  # Return immediately if poetry is not found
  if (( $+commands[pyenv] )); then

    pyenv install $PYVERSION
    pyenv global $PYVERSION

    brew install pipx
    pipx ensurepath

    curl -sSL https://install.python-poetry.org | python3 -

  fi
}

# Install Neovim
function install_neovim() {
  git clone git@github.com:NickCrew/nvim-pde.git 
  ~/.config/nvim/tools/update-nvim-nightly
  npm install -g neovim
}



