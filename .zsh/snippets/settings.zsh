GPG_TTY=$(tty)
export GPG_TTY
export PAGER=less
export EDITOR=nvim
export FZF_COMPLETION_TRIGGER=';;'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket


unsetopt beep			# shut up shut up shut up
unsetopt clobber		# Disallow overwriting existing files
setopt local_traps		# Allow functions to have local traps
setopt local_options	# Allow fucntions to have local options
setopt ignore_eof		# Don't exit on EOF
setopt no_bg_nice		# Don't run bg jobs at a lower priority
setopt no_hup			# Don't kill jobs when the shell exits
setopt notify			# notify when background job finishes				


alias v='vi'
alias po='poetry'
alias lg='lazygit'
alias ls='exa'
alias la='ls -ah'
alias ll='ls -lah'
alias l='ls -lh'
alias wstt='wezterm cli set-tab-title'

if (( $+commands[kubectl])); then
  alias k='kubectl'
  compdef k=kubectl
fi

(( $+commands[yadm] )) && compdef yadm=git


