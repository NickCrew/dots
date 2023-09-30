## ----------------------------------------------
# File: 
#   ~/.zshenv
#
# Availability:
#   ☑ Interactive Shells
#   ☑ Non-Interactive Shells
#
# Updated:
#  - Every new shell
## ------------------------------------------------------------------------------




export ZDOTDIR="${HOME}/.zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME}/.cache/zsh"


path=("/usr/local/sbin" $path)
path=("/usr/local/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)
path=("$HOME/Applications" $path)
export PATH


[[ ! -f $HOME/.orbstack/shell/init.zsh ]] || source $HOME/.orbstack/shell/init.zsh
[[ ! -f $HOME/.cargo/env ]] || source $HOME/.cargo/env

if [[ $(uname) == 'Darwin' ]]; then
  alias nvim='~/opt/nvim-macos/bin/nvim'
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
  export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

  if [[ $(uname -m) = "x86_64" ]]; then
      eval "$(/usr/local/HomeBrew/bin/brew shellenv)"
  else
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

typeset -U PATH
