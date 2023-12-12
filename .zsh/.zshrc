# vim: foldmethod=marker
# ------------------------------------------------------------------------------
# 
# NAME: .zshrc 
#
# ☑ Interactive Shells
# ☐ Non-Interactive Shells
#
# ORDER: zprofile  → zshrc* →  zlogin*
#------------------------------------------------------------------------------


#===============================================================================
# Prompt/Init
#------------------------------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi

zmodload zsh/zprof  


#===============================================================================
# ZComet
#-------------------------------------------------------------------------------
if [[ ! -f ${ZDOTDIR}/.zcomet/bin/zcomet.zsh ]]; then
	command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR}/.zcomet/bin
fi
source ${ZDOTDIR}/.zcomet/bin/zcomet.zsh


#==============================================================================
# Envionrment
#-------------------------------------------------------------------------------
# CD Path
export CDPATH="${HOME}/.config:${HOME}/.local/share:${HOME}/Work:${HOME}/Code:${HOME}/Work/Projects"
# Function Path
fpath+="${ZDOTDIR}/functions"
if command -v brew &> /dev/null; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi
# Envvars
GPG_TTY=$(tty)
export GPG_TTY
export PAGER=less
export EDITOR=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
# History 
HISTFILE="$HOME/.zsh_history"
HISTORY_BASE=$HOME/.directory_history
PER_DIRECTORY_HISTORY_TOGGLE=^G
HISTSIZE=1000000
SAVEHIST=1000000
HISTORY_IGNORE="pwd:ls:ll:la:.."


#===============================================================================
# Options
#-------------------------------------------------------------------------------

setopt completealiases          # Make aliases work with completion nicely
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion
setopt nocaseglob               # Case-insensitive globbing
setopt auto_cd                  # Don't type cd
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt hist_no_functions		# Don't store function definitions
setopt hist_no_store			# Don't store history (fc -l) command
setopt extended_history			# Record timestamp of command in HISTFILE
setopt share_history          	# Share command history data
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history lissetopt hist_verify            	# Show command with history expansion to user before running it
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
unsetopt hist_beep				# Shut up shut up shut up
unsetopt beep			        # shut up shut up shut up
unsetopt clobber		        # Disallow overwriting existing files
setopt local_traps		        # Allow functions to have local traps
setopt local_options	        # Allow fucntions to have local options
setopt ignore_eof		        # Don't exit on EOF
setopt no_bg_nice		        # Don't run bg jobs at a lower priority
setopt no_hup			        # Don't kill jobs when the shell exits
setopt notify			        # notify when background job finishes				


#===============================================================================
# Completion 
#-------------------------------------------------------------------------------
zmodload zsh/complist  
zle -C _expand_alias complete-word _generic
# Use cache for commands using cache
zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
zstyle ':completion:alias-expension:*' completer _expand_alias
# Allow you to select in a menu
zstyle ':completion:*' menu select
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


#===============================================================================
# Keybindings
#-------------------------------------------------------------------------------
bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen?
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo


#===============================================================================
# Plugins 
#-------------------------------------------------------------------------------

# Prompt
P10K_CONFIG="${ZDOTDIR:-$HOME/.zsh}/.p10k.zsh"
if [[ -f $P10K_CONFIG ]]; then
  source $P10K_CONFIG
fi
zcomet load romkatv/powerlevel10k		
zcomet load jonmosco/kube-ps1

# Development
zcomet load ohmyzsh plugins/dash           

# Git
zcomet load ohmyzsh plugins/git             
zcomet load ohmyzsh plugins/gh              
zcomet load ohmyzsh plugins/git-hubflow     

# Encryption agents
zcomet load ohmyzsh plugins/gpg-agent
zcomet load ohmyzsh plugins/ssh-agent

# Kubernetes
zcomet load ohmyzsh plugins/kubectl

# Virtualization
zcomet load ohmyzsh plugins/multipass

# Navigation
zcomet load ohmyzsh plugins/direnv               # Run shell commands when entering a directory
zcomet load ohmyzsh plugins/zoxide               # A smarter cd command
zcomet snippet OMZ::lib/directories.zsh          # OMZ Directory Lib

# 1password CLI and Plugins
zcomet snippet OMZ::plugins/1password/1password.plugin.zsh
#zcomet snippet ${XDG_CONFIG_HOME:-$HOME/.config}/op/plugins.sh

zcomet load zsh-users/zsh-autosuggestions        # Autosuggestions
bindkey -M viins '^e' autosuggest-accept         # <CTRL+E> Accept Suggestion

zcomet load zsh-users/zsh-syntax-highlighting	 # zsh-syntax-highlighting
zcomet load zsh-users/zsh-completions		     # Completions	
zcomet load softmoth/zsh-vim-mode                # Vim Mode

zcomet compinit 

zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
export FZF_COMPLETION_TRIGGER=';;'

zcomet load ohmyzsh plugins/aws


#==============================================================================
# Aliases
#-------------------------------------------------------------------------------
alias la='ls -ah'
alias ll='ls -lah'
alias l='ls -lh'
alias ls='eza'
alias po='poetry'
alias lg='lazygit'
alias wstt='wezterm cli set-tab-title'
alias v='nvim'

if (( $+commands[kubectl]));    then alias k='kubectl'; compdef k=kubectl; fi;
if (( $+commands[yadm] ));      then compdef yadm=git; fi;
if (( $+commands[multipass] )); then alias mp='compdef'; compdef mp=multipass; fi;
if (( $+commands[eza] ));       then alias ls='eza'; compdef ls=eza; fi;


#===============================================================================
# Functions
#-------------------------------------------------------------------------------
export ZSH_HASH_DIR="${ZSH_HASH_DIR:-$HOME/.zsh/hashes}"
hashdir() {
    [ -z "$1" ] && echo "Pass hash to use for dir" && return 1
    hash -d "$1"="$(pwd)"
    echo hash -d "$1"=\""$(pwd)"\" >> $ZSH_HASH_DIR
}

# Make directory and cd into it
take () {
    mkdir -p "$1" && cd "$1"
}

# Navigate to project root
r () {
    cd "$(git rev-parse --show-toplevel 2>/dev/null)"
}

# Navigate to project under this dir
jj () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}

# Create temp directory
tmp () {
    [ "$1" = "view" ] && cd /tmp/workspaces && cd $(ls -t | fzf --preview 'ls -A {}') && return 0
    r="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p -p "$r" && pushd "$r"
}

# Autoload Functions
autoload br edit-zshrc edit-p10krc edit-weztermrc edit-nviminit portproc 

# Hash Directories
hash -d proj="$HOME/Work/Projects"
hash -d config="$HOME/.config"
hash -d nvimconfig="$HOME/.config/nvim"
hash -d nvimdata="$HOME/.local/share/nvim"

# Local settings
[[ ! -f $ZDOTDIR/.zlocal ]] || source ${ZDOTDIR}/.zlocal
