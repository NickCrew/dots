# Dev Workstation Setup
Provision my macOS development workstation

## Setup

### Core

````bash
git clone --bare https://github.com/NickCrew/dotfiles.git ~/.dots
git --worktree=$HOME --git-dir=$HOME/.dots checkout
````

### Tmux

````bash
git clone https://github.com/NickCrew/tmux-config.git ~/.config/tmux
echo 'source ~/.config/tmux/default.conf' > ~/.tmux.conf
````

### Neovim

__IDE built on Neovim.__ Includes support for VS Code language servers and snippets.

````Bash
git clone https://github.com/NickCrew/neovim-config.git ~/.config/nvim
````

### ZSH

Customized Z-Shell with `zcomet` plugin manager.

````bash
git clone https://github.com/NickCrew/zsh-config.git ~/.zsh
echo 'export ZDOTDIR="${HOME}/.zsh"' > ~/.zshenv
````

