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




export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/.zhistory"
HISTSIZE=1000000
SAVEHIST=1000000

export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

GPG_TTY=$(tty)
export GPG_TTY
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER=less

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export FZF_COMPLETION_TRIGGER=';;'

export CDPATH="${HOME}/.config:${HOME}/.local/share:${HOME}/Work:${HOME}/Code:${HOME}/Work/Projects"
export ZSH_HASH_DIR="${ZSH_HASH_DIR:-$ZDOTDIR/.zsh_hashes}"
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"

export P10K_CONFIG="${ZDOTDIR:-$HOME/.zsh}/.p10k.zsh"

path=("/usr/local/sbin" $path)
path=("/usr/local/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/bin" $path)
path=("$HOME/opt/bin" $path)
path=("$HOME/Applications" $path)
export PATH


if [[ $(uname) == 'Darwin' ]]; then
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

[[ ! -f $HOME/.cargo/env ]] || source $HOME/.cargo/env
. "$HOME/.cargo/env"
