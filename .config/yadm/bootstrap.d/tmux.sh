#!/usr/bin/env bash

set -e

if command -v tmux >/dev/null; then
	_version=$(tmux --version)

	if [ ! -d $HOME/.tmux/plugins/tpm ]; then
		echo "Installing tmux plugin manager..."
		git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
	fi
fi
