# vim:foldmethod=marker
# 
# .zshrc - configuration for interactive sessions
#


zmodload zsh/zprof  # Enable startup profiling. Use 'zprof' to see results.

# Bootstrap
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Configure function path
fpath=("${ZDOTDIR}/functions" "${fpath[@]}")# {{{}}}
autoload -Uz $fpath[1]/*(.:t)
fpath=("${HOME}/.local/share/zsh/functions" "${fpath[@]}")


#
# Load Plugins 
#
zcomet load romkatv/powerlevel10k		# super fast prompt
zcomet load bigH/git-fuzzy				# make git commands fuzzy
zcomet snippet ${HOME}/.fzf.zsh			# fzf
zcomet load urbainvaes/fzf-marks		# fzf-based directory bookmark tool
zcomet load romkatv/zsh-defer			# zsh-defer
zcomet load marzocchi/zsh-notify		# zsh-notify

zcomet snippet OMZ::lib/functions.zsh
zcomet snippet OMZ::lib/misc.zsh
zcomet snippet OMZ::lib/clipboard.zsh
# zcomet snippet OMZ::lib/git.zsh
zcomet snippet OMZ::lib/termsupport.zsh
zcomet snippet OMZ::lib/grep.zsh

zcomet load ohmyzsh plugins/bgnotify
zcomet load ohmyzsh plugins/colored-man-pages
zcomet load ohmyzsh plugins/colorize
zcomet load ohmyzsh plugins/compleat
zcomet load ohmyzsh plugins/copybuffer
zcomet load ohmyzsh plugins/copyfile
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/doctl
zcomet load ohmyzsh plugins/dotenv
zcomet load ohmyzsh plugins/encode64
zcomet load ohmyzsh plugins/extract
zcomet load ohmyzsh plugins/fabric
zcomet load ohmyzsh plugins/fancy-ctrl-z
zcomet load ohmyzsh plugins/fastfile
zcomet load ohmyzsh plugins/fd
zcomet load ohmyzsh plugins/gh
zcomet load ohmyzsh plugins/git-auto-fetch
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/gitignore
zcomet load ohmyzsh plugins/gnu-utils
zcomet load ohmyzsh plugins/golang
zcomet load ohmyzsh plugins/gpg-agent
zcomet load ohmyzsh plugins/httpie
zcomet load ohmyzsh plugins/invoke
zcomet load ohmyzsh plugins/iterm2
zcomet load ohmyzsh plugins/jira
zcomet load ohmyzsh plugins/jsontools
zcomet load ohmyzsh plugins/lpass
zcomet load ohmyzsh plugins/macos
zcomet load ohmyzsh plugins/magic-enter
zcomet load ohmyzsh plugins/man
zcomet load ohmyzsh plugins/mongocli
zcomet load ohmyzsh plugins/nomad
zcomet load ohmyzsh plugins/nmap
zcomet load ohmyzsh plugins/nvm
zcomet load ohmyzsh plugins/otp
zcomet load ohmyzsh plugins/poetry
zcomet load ohmyzsh plugins/ripgrep
zcomet load ohmyzsh plugins/rust
zcomet load ohmyzsh plugins/scd
zcomet load ohmyzsh plugins/ssh-agent
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/transfer
zcomet load ohmyzsh plugins/vault
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh plugins/web-search
zcomet load ohmyzsh plugins/zoxide

zcomet snippet ${ZDOTDIR}/integrations/p10k.zsh
zcomet snippet ${ZDOTDIR}/integrations/kitty.zsh
zcomet snippet ${ZDOTDIR}/integrations/mcfly.zsh
zcomet snippet ${ZDOTDIR}/integrations/exa.zsh
zcomet snippet ${ZDOTDIR}/integrations/nvim.zsh
zcomet snippet ${ZDOTDIR}/integrations/broot.zsh
zcomet snippet ${ZDOTDIR}/integrations/poetry.zsh
zcomet snippet ${ZDOTDIR}/integrations/pyenv.zsh
zcomet snippet ${ZDOTDIR}/zstyle.zsh
zcomet snippet "${ZDOTDIR}/.local.zsh"

zcomet load zsh-users/zsh-completions					# After
zcomet load zsh-users/zsh-autosuggestions				# After
zcomet load zdharma-continuum/fast-syntax-highlighting	# After
zcomet compinit 
zcomet load ohmyzsh plugins/aws

#
# Settings
# 
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
HISTORY_IGNORE="pwd:ls:ll:la:.."
PER_DIRECTORY_HISTORY_TOGGLE=^G
HISTORY_BASE=$HOME/.directory_history

#
# Keybindings
#
bindkey -M vicmd '^h' run-help								# [N] <Ctrl-H> : show man page for current command 								
bindkey -M viins '^h' run-help								# [I] <Ctrl-H> : show man page for current command 								
bindkey -M viins '^e' autosuggest-accept					# [I] <Ctrl-E> : Accept and complete auto-suggestion
bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen?
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo


#
# Options
#
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt auto_pushd				# Make cd push the old directory onto the stack
setopt notify					# Notifies you I guess
setopt complete_in_word			# Complete from both ends of a word.
setopt pushd_silent				# Do not print the directory name after pushd or popd
setopt pushd_ignore_dups		# Do not push multiple copies of the same directory onto the stack
setopt bang_hist				# perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt hist_no_functions		# don't store function definitions
setopt hist_no_store			# don't store history (fc -l) command
setopt extended_history			# record timestamp of command in HISTFILE
setopt share_history          	# share command history data
setopt hist_expire_dups_first 	# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# ignore duplicated commands history list
setopt hist_ignore_space      	# ignore commands that start with space
setopt hist_verify            	# show command with history expansion to user before running it
setopt hist_reduce_blanks		#  Remove superfluous blanks from each command line being added to the history list
setopt inc_append_History		# add new lines to the history file immediately (do not wait until exit)
unsetopt clobber				# Disallow overwriting existing files
unsetopt hist_beep				# shut up shut up shut up
unsetopt beep					# shut up shut up shut up


