# vim: ft=tmux foldmethod=marker 

tmux_conf="~/.config/tmux"
settings="$tmux_conf/settings.tmux"
default_theme="$tmux_conf/theme.tmux"
keybindings="$tmux_conf/keybindings.tmux"
nested_active="$tmux_conf/nested-active.tmux"
nested_inactive="$tmux_conf/nested-inactive.tmux"
nested_keybindings="$tmux_conf/nested-keybindings.tmux"


source $settings
source $keybindings
source $default_theme
source $nested_active
source $nested_keybindings

##
## PLUGINS
##
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-fpp'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-net-speed'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
#  Install Tmux Plugin Manager: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins
run -b '~/.tmux/plugins/tpm/tpm'
