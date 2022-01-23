# Dotfiles and Workstation Setup

## Installation

Clone this repository
````bash
git clone --bare https://github.com/NickCrew/dots.git ~/.dots
alias dots='git --work-tree=$HOME --git-dir=$HOME/.dots'
dots checkout
````

Config repos for ZSH, Neovim, and Tmux are cloned as separate repos by the setup script.

````bash
sh ~/.local/share/dots/setup https
````

Once ZSH is loaded, or as long as `~/bin` is in your `$PATH`, the `dots` command will be available permanently.  
Turn off listing untracked files.
````bash
dots config status.showUntrackedFiles no
````


