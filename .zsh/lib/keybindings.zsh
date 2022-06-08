# 
# ZSH Keybindings

#

# Ctrl-h : show man page for current command 
bindkey -M vicmd '^h' run-help
bindkey -M viins '^h' run-help
bindkey -M viins '^e' autosuggest-accept
# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo


