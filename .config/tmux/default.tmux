# vim: ft=tmux foldmethod=marker 

#: 1.0 VARIABLES {{{

tmux_conf="~/.config/tmux"
default_theme="$tmux_conf/theme.tmux"
nested_active="$tmux_conf/nested-active.tmux"
nested_inactive="$tmux_conf/nested-inactive.tmux"

# }}}
#---------------------------------------------#
# 2.0 - SETTINGS {{{ 
set -g prefix C-a  
set -g mode-keys vi
set -g mouse on
set -g default-command zsh
set -g history-limit 10000
set -g focus-events on
set -g status-interval 5
set -g base-index 1
set -g automatic-rename on
set -g default-terminal "screen-256color"
set -sg escape-time 10
setw -g pane-base-index 1
set-option -g renumber-windows on
# tell Tmux that outside terminal supports true color
# set -ga terminal-overrides ",xterm-256color*:Tc"
# for tmux 3.2, you can use the folloetting instead:
set -as terminal-features ",xterm-256color:RGB"

# }}}
#---------------------------------------------#
# 3.0 - KEYBINDINGS {{{

# Reload Tmux Config
unbind r
bind-key r source-file ~/.tmux.conf  
# Open buffer selection
bind-key B choose-buffer

# 3.1 - WINDOW NAV {{{

# Change Window Focus
bind f next-window
bind b previous-window
bind c new-window		

# Move Window and keep focus on moved window
bind S-Left swap-window -d -t -1
bind S-Right swap-window -d -t +1
# }}}

# 3.2 - PANE NAV {{{

# Pane Controls
bind - split-window -v
bind | split-window -h
bind x kill-pane
bind & kill-window

# Pane Navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Pane Sizing
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# }}}

# 3.3 - Copy and Paste {{{

# Visual Selection
bind-key -T copy-mode-vi 'v'   send -X begin-selection  
# Visual block selection
bind-key -T copy-mode-vi 'S-v' send -X rectangle-toggle  
# Yank/copy to tmux buffer
bind-key -T copy-mode-vi 'y'   send -X copy-selection-and-cancel  
# Paste yanked text
unbind p
bind p paste-buffer  

# }}}

# }}}
#---------------------------------------------#
# 4.0 - NESTED TOGGLE {{{

# Start with default theme + active focus mode
source $default_theme
source $nested_active

# Use <F12> to toggle between normal/nested focus mode
# and change the status bar accordiingly
bind -T root F12  \
	set prefix None \; \
  	set key-table off \; \
  	if -F '#{pane_in_mode}' 'send-keys -X cancel' \; \
	source $nested_inactive \; \

bind -T off F12 \
    set -u prefix \; \
    set -u key-table \; \
    set -u status-style \; \
    set -u window-status-current-style \; \
    set -u window-status-current-format \; \
	source $nested_active \; \

# }}}
#---------------------------------------------#
# 5.0 - PLUGINS {{{

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/vim-tmux'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

run -b '~/.tmux/plugins/tpm/tpm'

#  If You Need To Install Tmux Plugin Manager:
#      →    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins

# }}}
