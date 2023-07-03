# vim: ft=tmux
#
# Indicate this level has focus (normal mode)

# NEW COLORS FOR THIS MODE
secondary_label_colour="colour81"
secondary_field_value_colour="colour141"
alt_field_value_colour="colour15"

# CLOCK 
clock="#[fg=$secondary_label_colour] [#[fg=$secondary_field_value_colour]%H:%M#[fg=$secondary_label_colour]] #{prefix_highlight}"

# WINDOW NAMES (ANY)
window_name="#[fg=$alt_fg_colour]#I#[fg=$primary_fg_colour] #{window_name} "

# WINDOW NAME (ACTIVE)
active_window_name="#[bg=$primary_bg_colour]#[fg=$current_window_number_colour] #I#[fg=$secondary_label_colour] #{window_name} #[fg=$accent_fg_colour_alt]" 

# USERNAME and HOSTNAME
whoami="#[fg=$secondary_label_colour][#[fg=$secondary_fg_colour]#(whoami)#[fg=$secondary_label_colour]@#[fg=colour7]#H#[fg=$secondary_label_colour]]"

# WINDOW INDEX NUMBER
window_index="#[fg=$secondary_label_colour][#[bg=$primary_bg_colour]#[fg=$secondary_field_value_colour]#S#[fg=$secondary_label_colour]]"  


#
# APPLY NEW COLORS AND STATUS FORMAT
#
set -g status-right "$clock"
set -g status-left "$whoami$window_index" 
set -g window-status-format "$window_name"
set -g window-status-current-format "$active_window_name"
