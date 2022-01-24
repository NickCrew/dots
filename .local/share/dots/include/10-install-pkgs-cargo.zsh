#!/usr/bin/env zsh

# Rust packages
if ! command -v cargo >/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
source ~/.cargo/env

cargo install \
    zoxide \
    mcfly \
    ripgrep \
    fd-find \
    broot \
    bat \
    exa


