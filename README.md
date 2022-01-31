# Dev Workstation Setup
Provision my macOS development workstation

- IDE built on Neovim 
- ZSH developer shell
- Tmux

## Setup

````bash
git clone --bare https://github.com/NickCrew/dotfiles.git ~/.dots
git --worktree=$HOME --git-dir=$HOME/.dots checkout
````
