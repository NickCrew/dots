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
ARAXIS_ROOT=/Applications/Araxis\ Merge.app
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
export PATH="${ARAXIS_ROOT}/Contents/Utilities:${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init --path)"
