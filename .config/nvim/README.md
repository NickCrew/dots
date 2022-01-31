# Neovim IDE

Interactive Development Environment built on Neovim.

## Setup

It is recommended that you install Neovim from `HEAD`.

```bash
brew install --HEAD Neovim
```

Upgrade with

```bash
brew upgrade --fetch-HEAD neovim
```

### Fonts

A patched nerd font is recommended to properly display glyphs.

```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

### Tags

The `vim-gutentags` plugin can automatically manage tags. `ctags` is recommended.

```bash
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

### Ripgrep

Ripgrep is used in multiple spots for fast searching. Use `cargo` or brew to install.

```bash
brew install Ripgrep
```

### Lua

The `luarocks` package manager is useful.

```bash
brew install luarocks
```

A formating tool for Lua

```bash
luarocks install --server=https://luarocks.org/dev luaformatter
```

### Vimspector Configs

To debug node.js code, you can install a config for vimspector to your project.

```bash
npm -g install vimspector-config
```

### Cheatsheets and Custom help

Custom help docs are in `doc/halp`. To update help keywords for searching:

```vim
:helptags ~/.config/nvim/docs/
```

Add entries to the cheatsheet by editing `cheatsheet.txt`. The `:Cheatsheet` command will allow searching the cheatsheet
using telescope. `:Cheatsheet!` will open in a popup window.
