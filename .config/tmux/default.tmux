# ~/.config/tmux/default.tmux
#

set -g prefix C-a  
set -g mode-keys vi
set -g mouse on

# set -g default-command zsh
set -g default-terminal "screen-256color"
# tell Tmux that outside terminal supports true color
set -ga terminal-overrides ",xterm-256color*:Tc"

# for tmux 3.2, you can use the following setting instead:
# set -as terminal-features ",xterm-256color:RGB"

set -sg escape-time 10
set -g history-limit 10000
set -g focus-events on
set -g status-interval 5
set -g base-index 1
setw -g pane-base-index 1
set -g automatic-rename on
set-option -g renumber-windows on

unbind r
bind-key r source-file ~/.tmux.conf  
# Open buffer selection
bind-key B choose-buffer

# Change Window Focus
bind f next-window
bind b previous-window
bind c new-window		
# Move Window and keep focus on moved window
bind S-Left swap-window -d -t -1
bind S-Right swap-window -d -t +1
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
# Copy and Paste
bind-key -T copy-mode-vi 'v'   send -X begin-selection  # Visual selection 
bind-key -T copy-mode-vi 'S-v' send -X rectangle-toggle  # Visual block selection
bind-key -T copy-mode-vi 'y'   send -X copy-selection-and-cancel  # Yank/copy to tmux buffer
unbind p
bind p paste-buffer  # Paste yanked text


source ~/.config/tmux/nested-toggle.tmux    # Use <F12> to switch between nested tmux sessions
source ~/.config/tmux/active-status.tmux    # Start with status scheme of the native session
source ~/.config/tmux/themes/default.tmux   # Set the colorscheme

# To Install Tmux Plugin Manager:
#	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins

# Plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/vim-tmux'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

run -b '~/.tmux/plugins/tpm/tpm'
