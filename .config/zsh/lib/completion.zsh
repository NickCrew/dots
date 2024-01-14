##: # 25.1 Completino options
setopt completealiases          # Make aliases work with completion nicely
setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion
setopt nocaseglob               # Case-insensitive globbing
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt always_to_end

## 25.2. - Auto Complete
#zcomet load marlonrichert/zsh-autocomplete

## 25.3 - init completion system
zmodload zsh/complist  

zle -C _expand_alias complete-word _generic

zstyle ':completion:*' complete true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' menu select                                                                 # Allow you to select in a men
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' completer _extensions _complete _approximate      
zstyle ':completion:*' use-cache on                                                               # Use cache for commands using cache
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'     # See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"
zstyle ':completion:alias-expension:*' completer _expand_alias                                     # Complete the alias when _expand_alias is used as a function
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':omz:plugins:iterm2 shell-integration' yes
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}                              # Colors for files and directory
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories       # Only display some tags for the command cd
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
zstyle ':completion:*' group-name ''                                                              # Required for completion to be in good groups (named after the tags)
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
# Autocomplete options
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

#zstyle '*:compinit' arguments -D -i -u -C -w
##: Auto Complete Keybindings
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char					# select left in completion menu					
bindkey -M menuselect 'k' vi-up-line-or-history				# select above in completion menu
bindkey -M menuselect 'j' vi-down-line-or-history   		# select below in completion menu
bindkey -M menuselect 'l' vi-forward-char					# select right in completion menu
bindkey -M menuselect '^xg' clear-screen					# Clears the screen?
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo
# Make zsh autocomplete with up arrow
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

command -v kubectl >/dev/null && compdef k=kubectl 
