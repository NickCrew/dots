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
zcomet snippet "${ZDOTDIR}/lib/func.zsh"

fpath+="${ZDOTDIR}/functions"             # My functions
fpath+="${ZSH_CACHE_DIR}/completions"     # Completions
if command -v brew &> /dev/null; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi
autoload $(ls ${ZDOTDIR}/functions)


## Options
setopt no_bg_nice		        # Don't run bg jobs at a lower priority
setopt no_hup			        # Don't kill jobs when the shell exits
setopt notify			        # notify when background job finishes				
unsetopt beep			        # shut up shut up shut up
unsetopt clobber		        # Disallow overwriting existing files

##: HIstory Opts
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

# Aliases
alias la='ls -ah'
alias ll='ls -lah'
alias l='ls -lh'
alias po='poetry'
alias lg='lazygit'
alias wstt='wezterm cli set-tab-title'
alias v='nvim'
alias mp='multipass'
alias ls='eza'
alias t='terragrunt'
alias rr='ranger'
alias wt='wezterm'
alias k='kubectl'
alias x='xplr'


##: Directoreis
zcomet load ohmyzsh plugins/autoenv
zcomet load ohmyzsh plugins/direnv               # Run shell commands when entering a directory
zcomet load ohmyzsh plugins/zoxide               # A smarter cd command
zcomet snippet OMZ::lib/directories.zsh

###: Prompt 
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
zcomet load ohmyzsh plugins/gpg-agent
zcomet snippet OMZ::plugins/1password/1password.plugin.zsh
zcomet load ohmyzsh plugins/ssh-agent

##: All the fixins - Order matters here !!

zcomet snippet OMZ::lib/compfix.zsh
zcomet snippet "${ZDOTDIR}/lib/completion.zsh"
zcomet snippet OMZ::lib/correction.zsh

zcomet load zsh-users/zsh-autosuggestions        
bindkey -M viins '^e' autosuggest-accept        

zcomet load zsh-users/zsh-syntax-highlighting	
zcomet load zsh-users/zsh-completions		   
zcomet load softmoth/zsh-vim-mode             

##: FZF
zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh

##: AWS
zcomet load ohmyzsh plugins/aws

##: Completion

##: Local settings
[[ ! -f $ZDOTDIR/.zlocal ]] || source ${ZDOTDIR}/.zlocal

