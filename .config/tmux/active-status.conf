# ~/.tmux.conf.d/status-active.conf
#
# Indicate this level has focus 

secondary_label_colour="colour81"           
secondary_field_value_colour="colour141"
alt_field_value_colour="colour15"
set -g status-right "#[fg=$secondary_label_colour] [#[fg=colour141]%H:%M#[fg=$secondary_label_colour]] #{prefix_highlight}"
set -g status-left "#[fg=$secondary_label_colour][#[bg=$primary_bg_colour]#[fg=$secondary_field_value_colour]#S#[fg=$secondary_label_colour]] " 
set -g window-status-format "#[fg=$alt_fg_colour] #I#[fg=$primary_fg_colour] #{window_name} " 
set -g window-status-current-format "#[bg=primary_bg_colour]#[fg=$current_window_number_colour] #I#[fg=$secondary_label_colour] #{window_name} #[fg=$accent_fg_colour_alt]" 

