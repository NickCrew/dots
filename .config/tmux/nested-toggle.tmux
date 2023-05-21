# vim: set ft=tmux
#
bind -T root F12  \
	set prefix None \; \
  	set key-table off \; \
  	if -F '#{pane_in_mode}' 'send-keys -X cancel' \; \
	source ~/.config/tmux/inactive-status.tmux \; \

bind -T off F12 \
    set -u prefix \; \
    set -u key-table \; \
    set -u status-style \; \
    set -u window-status-current-style \; \
    set -u window-status-current-format \; \
	source ~/.config/tmux/active-status.tmux \; \

