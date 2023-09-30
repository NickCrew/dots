
# vim: foldmethod=marker
# ------------------------------------------------------------------------------
# File: 
#   .zshrc 
#
# Loaded For:
#   ☑ Interactive Shells
#   ☐ Non-Interactive Shells
#
## Load Order:
#       zprofile  → zshrc* →  zlogin*

# ------------------------------------------------------------------------------



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Start profiling
zmodload zsh/zprof  

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# Initialize Zcomet
if [[ ! -f ${ZDOTDIR}/.zcomet/bin/zcomet.zsh ]]; then
	command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR}/.zcomet/bin
fi
source ${ZDOTDIR}/.zcomet/bin/zcomet.zsh


# Local configuration
if [ -f $ZDOTDIR/.zlocal.zsh ]; then
  source ${ZDOTDIR}/.zlocal.zsh
fi


# Autoload functions
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $ZSH_CACHE_DIR/completions $fpath)
autoload -Uz $fpath[1]/*(.:t)
fpath+="$(brew --prefix)/share/zsh/site-functions" 


# Aliases
(( $+commands[exa] )) && alias ls='exa'
alias nvim='~/opt/nvim-macos/bin/nvim'
alias la='ls -ah'
alias ll='ls -lah'
alias l='ls -lh'
# wezterm
alias wstt='wezterm cli set-tab-title'
alias k='kubectl'

# ZSH
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'


zmodload zsh/complist  # Should be called before compinit

unsetopt completealiases        # Don't expand aliases before completionfinishes
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion

zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
zle -C alias-expension complete-word _generic
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
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen?
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo

# }}}

# {{{ 3.0 - Plugins 

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
zcomet load zsh-users/zsh-syntax-highlighting	
zcomet load zsh-users/zsh-completions			
zcomet load softmoth/zsh-vim-mode

zcomet compinit 

zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin

if command -v aws_completer &> /dev/null; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
  complete -C aws_completer sam
fi

compdef k=kubectl

eval "$(pyenv init --path)"

GPG_TTY=$(tty)
export GPG_TTY
export FZF_COMPLETION_TRIGGER=';;'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket


# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HISTORY_IGNORE="pwd:ls:ll:la:.."
PER_DIRECTORY_HISTORY_TOGGLE=^G
HISTORY_BASE=$HOME/.directory_history

# History
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt hist_no_functions		# Don't store function definitions
setopt hist_no_store			# Don't store history (fc -l) command
setopt extended_history			# Record timestamp of command in HISTFILE
setopt share_history          	# Share command history data
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history list
setopt hist_ignore_space      	# Ignore commands that start with space
setopt hist_verify            	# Show command with history expansion to user before running it
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
unsetopt hist_beep				# Shut up shut up shut up


unsetopt beep			# shut up shut up shut up
unsetopt clobber		# Disallow overwriting existing files
setopt local_traps		# Allow functions to have local traps
setopt local_options	# Allow fucntions to have local options
setopt ignore_eof		# Don't exit on EOF
setopt no_bg_nice		# Don't run bg jobs at a lower priority
setopt no_hup			# Don't kill jobs when the shell exits
setopt notify			# notify when background job finishes				


#
# Post 
#

bindkey -M vicmd '^h' run-help				# [N] <Ctrl-H> : show man page for current command 								
bindkey -M viins '^h' run-help				# [I] <Ctrl-H> : show man page for current command 								
bindkey -M viins '^e' autosuggest-accept	# [I] <Ctrl-E> : Accept and complete auto-suggestion

# 1password cli
[[ ! -f $HOME/.config/op/plugins.sh ]] || source $HOME/.config/op/plugins.sh

# powerlevel10k prompt
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh


