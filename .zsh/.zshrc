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
zcomet load romkatv/zsh-defer
# OMZ plugins and snippets
zcomet snippet OMZ::lib/clipboard.zsh
zcomet snippet OMZ::lib/directories.zsh
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/extract
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/lpass
zcomet load ohmyzsh plugins/otp
zcomet load ohmyzsh plugins/poetry
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/vault
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh plugins/zoxide

# Libs - provide customization to native ZSH
source ${zlibs}/completion.zsh
source ${zlibs}/aliases.zsh
source ${zlibs}/keybindings.zsh
source ${zlibs}/options.zsh
source ${zlibs}/history.zsh
source ${zlibs}/exports.zsh
# Snippets - provide integration with third-party apps
source ${zsnippets}/p10k.zsh
source ${zsnippets}/kitty.zsh
source ${zsnippets}/mcfly.zsh
source ${zsnippets}/exa.zsh
source ${zsnippets}/nvim.zsh
source ${zsnippets}/broot.zsh
source ${ZDOTDIR}/.local.zsh

# load last
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet compinit
zcomet load ohmyzsh plugins/aws

eval "$(pyenv init -)"

# zsh profiling
 # zprof
