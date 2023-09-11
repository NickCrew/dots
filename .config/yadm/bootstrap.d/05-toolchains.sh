#!/bin/bash

OS=$(uname -s)
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

function install_toolchain_rust () {
  if ! command -v cargo >/dev/null; then
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
}

function install_toolchain_node() {
if ! command -v node >/dev/null; then
	if ! command -v nvm >dev/null; then
		PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
	fi
	nvm install node
fi
}

function install_toolchain_python() {
  if ! command -v pyenv >/dev/null; then
    curl https://pyenv.run | bash
  fi

  if ! command -v poetry >/dev/null; then
    curl -sSL https://install.python-poetry.org | python3 -
  fi
}

install_toolchain_brew
install_toolchain_rust
install_toolchain_node
install_toolchian_python


