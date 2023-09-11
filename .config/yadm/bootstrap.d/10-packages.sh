#!/bin/bash 

function install_brew_packages(){
      brew install \
        ansible \
        ansible-lint \
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
    remark

}


install_node_packages
