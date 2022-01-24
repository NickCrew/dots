# Dev Workstation Setup
Provision my macOS development workstation

## Dotfiles

````bash
curl -fsSL https://gist.githubusercontent.com/NickCrew/86359f91376b49f0b011bc1ad4b1dcac/raw/abc741340bb22cc54f49555e8e2c250434118f57/install-dots.sh | zsh
````

## Sane Defaults for macOS
````bash
curl -fsSL https://gist.githubusercontent.com/NickCrew/405afb9a78d14bd34164329bdd854e6c/raw/9a8d322e411b5c3818cf602159b2f90000ece79c/macos-sane-defaults.sh | zsh
````

## Install Development Tools
Installs `nvim` and its dependencies plus other CLI tools.
````bash
curl -fsSL https://gist.githubusercontent.com/NickCrew/13a97a47f78f7ec4b229f48db1d3a7d8/raw/984f478a3cdfe2bce29bae92a12ff17d93821e69/install-macos-dev-tools.sh | zsh -c devtools neovim
````


