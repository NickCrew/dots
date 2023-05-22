# ~/.zshenv
#
# - Updated on every new shell and vailable to non-interactive commands
#

export ZDOTDIR="${HOME}/.zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME}/.cache/zsh"

path=("/usr/local/sbin" $path)
path=("/usr/local/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)
path=("$HOME/Applications" $path)
export PATH

test -e ~/.cargo/env && source ~/.cargo/env
