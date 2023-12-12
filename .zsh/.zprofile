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
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
path=("${PYENV_ROOT}/bin" $path)
export PATH

eval "$(pyenv init --path)"
