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

# Pyenv
if (( ! $+commands[pyenv] )); then
	export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
	eval "$(pyenv init --path)"
fi
