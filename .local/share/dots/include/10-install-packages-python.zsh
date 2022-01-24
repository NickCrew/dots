#!/usr/bin/env zsh
#

brew install pyenv pyenv-virtualenv pyenv-virtualenvwrapper pipx
pip install --user pynvim                                       
pip install --user 'python-lsp-server[all]' pylsp-mypy pyls-isort      

pipx install \
    pylint \
    ansible \
    ansible-lint \
    yapf \
    autopep8 

