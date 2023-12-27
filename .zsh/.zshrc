# .zshrc
#---------------------------------------------------

##: 00 - Initialize

##: 01 - Instant Prompt
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi

##: Start Profiling
zmodload zsh/zprof  

##: ZComet Plugin Manger
if [[ ! -f ${ZDOTDIR}/.zcomet/bin/zcomet.zsh ]]; then
	command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR}/.zcomet/bin
fi
source ${ZDOTDIR}/.zcomet/bin/zcomet.zsh

##: Function Path
fpath+="${ZDOTDIR}/functions"             # My functions
fpath+="${ZSH_CACHE_DIR}/completions"     # Completions
if command -v brew &> /dev/null; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi
autoload $(ls ${ZDOTDIR}/functions)


# Exports
export PAGER=most
export EDITOR=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

 # Opts
setopt no_bg_nice		        # Don't run bg jobs at a lower priority
setopt no_hup			        # Don't kill jobs when the shell exits
setopt notify			        # notify when background job finishes				
unsetopt beep			        # shut up shut up shut up
unsetopt clobber		        # Disallow overwriting existing files


##: Our library
zcomet snippet "${ZDOTDIR}/lib/aliases.zsh"
zcomet snippet "${ZDOTDIR}/lib/hist.zsh"
zcomet snippet "${ZDOTDIR}/lib/func.zsh"

##: Directoreis
zcomet load ohmyzsh plugins/direnv               # Run shell commands when entering a directory
zcomet load ohmyzsh plugins/zoxide               # A smarter cd command
zcomet snippet OMZ::lib/directories.zsh

export CDPATH="${HOME}/.config:${HOME}/.local/share:${HOME}/Work:${HOME}/Code:${HOME}/Work/Projects"
export ZSH_HASH_DIR="${ZSH_HASH_DIR:-$HOME/.zsh/hashes}"

##: Prompt 
P10K_CONFIG="${ZDOTDIR:-$HOME/.zsh}/.p10k.zsh"
test -e "$P10K_CONFIG" && source "$P10K_CONFIG"
zcomet load romkatv/powerlevel10k		
zcomet load jonmosco/kube-ps1

##: Git
zcomet snippet OMZ::lib/git.zsh
zcomet load ohmyzsh plugins/git             
zcomet load ohmyzsh plugins/gh              
zcomet load ohmyzsh plugins/git-hubflow     

##: Development Tools
zcomet load ohmyzsh plugins/dash           
zcomet load ohmyzsh plugins/kubectl

##: Security and encryption
GPG_TTY=$(tty)
export GPG_TTY
zcomet load ohmyzsh plugins/gpg-agent
zcomet snippet OMZ::plugins/1password/1password.plugin.zsh
zcomet load ohmyzsh plugins/ssh-agent

##: All the fixins - Order matters here !!
zcomet load zsh-users/zsh-autosuggestions        
bindkey -M viins '^e' autosuggest-accept        

zcomet load zsh-users/zsh-syntax-highlighting	
zcomet load zsh-users/zsh-completions		   
zcomet load softmoth/zsh-vim-mode             

##: FZF
zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
export FZF_COMPLETION_TRIGGER=';;'

##: AWS
zcomet load ohmyzsh plugins/aws

##: Completion
zcomet snippet OMZ::lib/compfix.zsh
zcomet snippet "${ZDOTDIR}/lib/completion.zsh"

##: Correction
zcomet snippet OMZ::lib/correction.zsh

##: Local settings
[[ ! -f $ZDOTDIR/.zlocal ]] || source ${ZDOTDIR}/.zlocal
