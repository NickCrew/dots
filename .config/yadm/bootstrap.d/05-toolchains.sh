#!/bin/bash

OS=$(uname -s)
PY=3.11.4

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
    npm install -g \
      bitwarden \
      taplo \
      ansible-language-server \
      asl-validator \
      eslint \
      markdown-toc \
      prettier \
      pyright \
      remark
  fi
}

function install_toolchain_python() {
  curl https://pyenv.run | bash

  pyenv install $PY
  pyenv global $PY

  brew install pipx
  pipx ensurepath

  curl -sSL https://install.python-poetry.org | python3 -

}


install_toolchain_brew
install_toolchain_rust
install_toolchain_node
install_toolchian_python


