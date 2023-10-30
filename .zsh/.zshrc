# vim: foldmethod=marker
# ------------------------------------------------------------------------------
# 
# NAME: .zshrc 
#
# ☑ Interactive Shells
# ☐ Non-Interactive Shells
#
# ORDER: zprofile  → zshrc* →  zlogin*

# ------------------------------------------------------------------------------



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Start profiling
zmodload zsh/zprof  

# Initialize Zcomet
if [[ ! -f ${ZDOTDIR}/.zcomet/bin/zcomet.zsh ]]; then
	command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR}/.zcomet/bin
fi
source ${ZDOTDIR}/.zcomet/bin/zcomet.zsh


zcomet snippet ${ZDOTDIR}/snippets/completion.zsh

# Autoload functions
fpath+="${ZDOTDIR}/functions"
fpath+="${ZSH_CACHE_DIR}/completions"
autoload -Uz $fpath[1]/*(.:t)
fpath+="$(brew --prefix)/share/zsh/site-functions" 



zcomet load romkatv/powerlevel10k		

zcomet load ohmyzsh plugins/dash
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gcloud
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/gnu-utils
zcomet load ohmyzsh plugins/gpg-agent
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/history-substring-search
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/zoxide

zcomet trigger npm ohmyzsh plugins/npm
zcomet trigger nvm ohmyzsh plugins/nvm
zcomet trigger tmux ohmyzsh plugins/tmux

zcomet snippet OMZ::lib/directories.zsh
zcomet snippet OMZ::plugins/1password/1password.plugin.zsh
zcomet snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
zcomet snippet OMZ::plugins/copypath/copypath.plugin.zsh

zcomet load zsh-users/zsh-autosuggestions			
bindkey -M viins '^e' autosuggest-accept



zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin

if command -v aws_completer &> /dev/null; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
  complete -C aws_completer sam
fi

zcomet load zsh-users/zsh-syntax-highlighting	
zcomet load zsh-users/zsh-completions			
zcomet load softmoth/zsh-vim-mode

zcomet compinit 

autoload br
[[ ! -f ${ZDOTDIR}/snippets/settings.zsh ]] || source ${ZDOTDIR}/snippets/settings.zsh
[[ ! -f ${ZDOTDIR}/snippets/hist.zsh ]] || source ${ZDOTDIR}/snippets/hist.zsh
[[ ! -f $HOME/.config/op/plugins.sh ]] || source $HOME/.config/op/plugins.sh
[[ ! -f $HOME/.zsh/.p10k.zsh ]] || source $HOME/.zsh/.p10k.zsh
[[ ! -f $ZDOTDIR/.zlocal ]] || source ${ZDOTDIR}/.zlocal

