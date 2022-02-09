# .zshrc - configuration for interactive sessions

#zmodload zsh/zprof

# {{{ Initialize

# Powerlevel10k Fast Loading
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
# }}}

ZSH_CACHE_DIR="${HOME}/.cache/zsh"  # Used by several OMZ plugins

fpath=("${ZDOTDIR}/functions" "${fpath[@]}")
autoload -Uz $fpath[1]/*(.:t)
fpath=("${HOME}/.local/share/zsh/functions" "${fpath[@]}")

zlibs=${ZDOTDIR}/lib
zsnips=${ZDOTDIR}/snippets

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

zcomet trigger zsh-prompt-benchmark romkatv/zsh-prompt-benchmark

zcomet load romkatv/powerlevel10k
[[ -f ${ZDOTDIR}/.p10k.zsh ]] && source ${ZDOTDIR}/.p10k.zsh

zcomet load bigH/git-fuzzy
zcomet load urbainvaes/fzf-marks

# oh-my-zsh plugins
zcomet load ohmyzsh plugins/alias-finder
zcomet load ohmyzsh plugins/aliases
zcomet load ohmyzsh plugins/aws
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/mongocli
zcomet load ohmyzsh plugins/nvm
zcomet load ohmyzsh plugins/pyenv
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/terraform
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh plugins/zoxide
# oh-my-zsh snippets
zcomet snippet OMZ::lib/clipboard.zsh
zcomet snippet OMZ::lib/directories.zsh


# intialize tools
command -v pyenv >/dev/null && pyenv virtualenvwrapper_lazy
command -v mcfly >/dev/null && eval "$(mcfly init zsh)"
command -v broot 1>/dev/null && test -e "${HOME}/.config/broot/launcher/bash/br" && source "${HOME}/.config/broot/launcher/bash/br"
command -v funky >/dev/null && eval "$(funky --init zsh)"
command -v tmuxp >/dev/null && eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"


# my customizations
zcomet snippet ${zlibs}/hist.zsh
zcomet snippet ${zlibs}/exports.zsh
zcomet snippet ${zlibs}/aliases.zsh
zcomet snippet ${zlibs}/setopt.zsh
zcomet snippet ${zlibs}/keybindings.zsh
zcomet snippet ${zlibs}/completion.zsh
# local snippets I don't want to appear in source control
zcomet snippet ${ZDOTDIR}/local.zsh


# load last
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions
zcomet load zdharma-continuum/fast-syntax-highlighting

zcomet compinit

# zsh profiling
#zprof
