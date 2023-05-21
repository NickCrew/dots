# ~/.tmux.conf.d/status-inactive.conf
#
# Indicate this level does not have focus
# 


secondary_label_colour="colour246"
secondary_field_value_colour="colour246"
alt_field_value_colour="colour246"
set -g status-right "#[fg=$secondary_fg_colour][ INACTIVE #[fg=$primary_accent_fg_colour]]"
set -g status-left "#[fg=$secondary_label_colour][#[fg=$secondary_fg_colour]#[fg=$alt_field_value_colour]#(whoami)@#H#[fg=$secondary_label_colour]][#[bg=$primary_bg_colour]#[fg=$secondary_field_value_colour]#S#[fg=$secondary_label_colour]] " 
set -g window-status-format "#[fg=$secondary_fg_colour] #I #{window_name} " 
set -g window-status-current-format "#[fg=$secondary_fg_colour] #I #{window_name} " 


