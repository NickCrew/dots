# ----------------------------------------------
# File: 
#   $ZDOTDIR/.zprofile (*)
#
# Availability :
#   ☑ Interactive Shellsⁱ
#   ☑ Non-interactive Shells
#
# Load Order:    
#     zprofile* →  zshrc → zlogin
#
# ------------------------------------------------------------------------------

#
# Editors
#
#
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-most}"
export MANPATH="$HOME/.local/share/man:/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOME/.local/share/info:/opt/homebrew/share/info:${INFOPATH:-}"

if [[ $(uname) == 'Darwin' ]]; then
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

fi


typeset -gU path fpath

path=(
  $HOME/.pyenv/bin
  $HOME/.cargo/bin
  $HOME/bin
  $HOME/.local/bin
  $HOME/opt/bin
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

