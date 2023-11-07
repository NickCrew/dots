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


# My completions
zmodload zsh/complist  
zcomet snippet ${ZDOTDIR}/snippets/completion.zsh

# Autoload functions
fpath+="${ZDOTDIR}/functions"
fpath+="${ZSH_CACHE_DIR}/completions"
autoload -Uz $fpath[1]/*(.:t)
fpath+="$(brew --prefix)/share/zsh/site-functions" 


# Prompt 
[[ ! -f $HOME/.zsh/.p10k.zsh ]] || source $HOME/.zsh/.p10k.zsh
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

zcomet load zsh-users/zsh-autosuggestions			
bindkey -M viins '^e' autosuggest-accept

zcomet load zsh-users/zsh-syntax-highlighting	
zcomet load zsh-users/zsh-completions			
zcomet load softmoth/zsh-vim-mode

zcomet compinit 

zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
zcomet load ohmyzsh plugins/aws


# Misc settings
[[ ! -f ${ZDOTDIR}/snippets/settings.zsh ]] || source ${ZDOTDIR}/snippets/settings.zsh
# History configuration
[[ ! -f ${ZDOTDIR}/snippets/hist.zsh ]] || source ${ZDOTDIR}/snippets/hist.zsh
# 1Password plugins (aws, gh, etc)
[[ ! -f $HOME/.config/op/plugins.sh ]] || source $HOME/.config/op/plugins.sh
# Local settings
[[ ! -f $ZDOTDIR/.zlocal ]] || source ${ZDOTDIR}/.zlocal
autoload br
