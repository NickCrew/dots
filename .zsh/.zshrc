# vim:foldmethod=marker
# 
# .zshrc - configuration for interactive sessions
#

zmodload zsh/zprof  # Enable startup profiling. Use 'zprof' to see results.
source $ZDOTDIR/lib/init_zcomet.zsh

fpath=("${ZDOTDIR}/functions" "${fpath[@]}")# {{{}}}
autoload -Uz $fpath[1]/*(.:t)
fpath=("${HOME}/.local/share/zsh/functions" "${fpath[@]}")

# zcomet - load plugins {{{
zcomet trigger zsh-prompt-benchmark romkatv/zsh-prompt-benchmark
zcomet load romkatv/powerlevel10k		# p10k prompt
zcomet load bigH/git-fuzzy				# git fuzzy
zcomet snippet ${HOME}/.fzf.zsh			# fzf
zcomet load urbainvaes/fzf-marks		# fzf-marks
zcomet load romkatv/zsh-defer			# zsh-defer

# }}}

# zcomet - OMZ {{{
# ---------------------------------------------------

# omz snippets
# ---------------------------------------------------
zcomet snippet OMZ::lib/clipboard.zsh
zcomet snippet OMZ::lib/directories.zsh

# omz plugins
# ---------------------------------------------------
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/extract
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/lpass
zcomet load ohmyzsh plugins/nvm
zcomet load ohmyzsh plugins/otp
zcomet load ohmyzsh plugins/poetry
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/vault
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh plugins/zoxide
# }}}

# zcomet - Local {{{
# ---------------------------------------------------
# snippets - app integration 
zcomet snippet ${ZDOTDIR}/integrations/p10k.zsh
zcomet snippet ${ZDOTDIR}/integrations/kitty.zsh
zcomet snippet ${ZDOTDIR}/integrations/mcfly.zsh
zcomet snippet ${ZDOTDIR}/integrations/exa.zsh
zcomet snippet ${ZDOTDIR}/integrations/nvim.zsh
zcomet snippet ${ZDOTDIR}/integrations/broot.zsh
zcomet snippet ${ZDOTDIR}/integrations/poetry.zsh
zcomet snippet ${ZDOTDIR}/integrations/pyenv.zsh
# snippets - settings library
zcomet snippet ${ZDOTDIR}/lib/completion.zsh
zcomet snippet ${ZDOTDIR}/lib/hist.zsh
zcomet snippet ${ZDOTDIR}/lib/aliases.zsh
zcomet snippet ${ZDOTDIR}/lib/opts.zsh
zcomet snippet ${ZDOTDIR}/lib/keybindings.zsh
# special - local setup
test -e ${ZDOTDIR}/.local.zsh && zcomet snippet ${ZDOTDIR}/.local.zsh

# }}}

# zcomet - Load Last {{{
# ---------------------------------------------------
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet compinit
zcomet load ohmyzsh plugins/aws

# }}}


