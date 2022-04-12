# .zshrc - configuration for interactive sessions

# zmodload zsh/zprof

# {{{ Initialize
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

ZSH_CACHE_DIR="${HOME}/.cache/zsh"  # Used by several OMZ plugins
zsnippets=${ZDOTDIR}/snippets
zlibs=${ZDOTDIR}/lib

# }}}

fpath=("${ZDOTDIR}/functions" "${fpath[@]}")
autoload -Uz $fpath[1]/*(.:t)
fpath=("${HOME}/.local/share/zsh/functions" "${fpath[@]}")

zcomet trigger zsh-prompt-benchmark romkatv/zsh-prompt-benchmark
# Third-party plugins
zcomet load romkatv/powerlevel10k
zcomet load bigH/git-fuzzy
zcomet snippet ${HOME}/.fzf.zsh
zcomet load urbainvaes/fzf-marks
# OMZ plugins and snippets
zcomet snippet OMZ::lib/clipboard.zsh
zcomet snippet OMZ::lib/directories.zsh
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/extract
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/gnu-utils
zcomet load ohmyzsh plugins/encode64
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/jsontools
zcomet load ohmyzsh plugins/lpass
zcomet load ohmyzsh plugins/otp
zcomet load ohmyzsh plugins/poetry
zcomet load ohmyzsh plugins/pyenv
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/vault
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh plugins/zoxide
# Libs - provide customization to native ZSH
zcomet snippet ${zlibs}/completion.zsh
zcomet snippet ${zlibs}/aliases.zsh
zcomet snippet ${zlibs}/keybindings.zsh
zcomet snippet ${zlibs}/options.zsh
zcomet snippet ${zlibs}/history.zsh
zcomet snippet ${zlibs}/exports.zsh
# Snippets - provide integration with third-party apps
zcomet snippet ${zsnippets}/p10k.zsh
zcomet snippet ${zsnippets}/kitty.zsh
zcomet snippet ${zsnippets}/nvim.zsh
zcomet snippet ${zsnippets}/mcfly.zsh
zcomet snippet ${zsnippets}/exa.zsh
zcomet snippet ${zsnippets}/broot.zsh
zcomet snippet ${ZDOTDIR}/.local.zsh
# load last
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet compinit
zcomet load ohmyzsh plugins/aws

# zsh profiling
# zprof
