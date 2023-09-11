#!/bin/bash 

function install_brew_packages(){
      brew install \
        ansible \
        ansible-lint \
        direnv \
        github-markdown-toc \
        github-release 

      brew install --cask \
        wezterm-nightly
}

function install_rust_packages() {
  if ! command -v cargo >/dev/null ; then
    echo "cargo not found!"; exit 1;
  fi

  cargo install \
    bat \ 
    broot \
    code-minimap \
    distant \
    exa \
    fzf \ 
    mcfly \
    stylua \
    zoxide 
}

function install_node_packages() {
  if ! command -v npm >/dev/null ; then
    echo "npm not found!" exit 1;
  fi
  npm install -g \
    bitwarden \
    taplo \
    ansible-language-server \
    asl-validator \
    eslint \
    markdown-toc \
    prettier \
    pyright \
    remark \
    yamlinc 

}


install_brew_packages
install_rust_packages
install_node_packages
