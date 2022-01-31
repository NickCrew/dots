#!/usr/bin/env bash

if [[ -f ~/.tmux.conf ]]; then
    mv ~/.tmux.conf ~/.tmux.conf.orig
    echo "Created backup of existing tmux configuration at ~/.tmux.conf.orig"
fi

echo 'source ~/.tmux.conf.d/default.conf' > ~/.tmux.conf
