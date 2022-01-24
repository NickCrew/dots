# Dotfiles and Workstation Setup

## Installation

Clone this repository
````bash
git clone --bare https://github.com/NickCrew/dots.git ~/.dots
alias dots='git --work-tree=$HOME --git-dir=$HOME/.dots'
dots checkout
dots config status.showUntrackedFiles no
````

Add the `dots` tools to your `$PATH`:
````bash
export PATH="${HOME}/.local/share/dots/bin:${PATH}"
````

### Setup

Call `dots-init` to configure the baseline environment and set the protocol to use for dots git repo (https or git).

````bash
dots-init https
````

### Provision

Install package groups and dependencies using `dots-tool-installer`:

- Interactive dev tools
- Language tools (lang server, formatters, debuggers, etc)
- Neovim

````bash
dots-tool-installer dev
dots-tool-installer build
dots-tool-installer neovim
````

