# Foregrounds
primary_fg_colour="colour253" # white/grey
secondary_fg_colour="colour246" # grey/grey
alt_fg_colour="colour7"
# Backgrounds
primary_bg_colour="colour236" # dark/grey
# Values
secondary_field_value_colour="colour141"	# violet
alt_field_value_colour="colour15"
# Keys
primary_label_colour="colour131"		# orange
secondary_label_colour="colour81"      # blue
# Windows
current_window_number_colour="colour208" # deep purple
current_window_hi_colour="colour74"     # blue
# }}}

# Pane Border
set -g pane-active-border-style fg=colour38
set -g pane-border-style fg=colour236
# Status Bar
set -g status-fg $primary_fg_colour
set -g status-bg $primary_bg_colour
# Status left
set -g status-left-length 39
set -g status-left-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g status-left "#[fg=$secondary_label_colour][#[fg=$secondary_fg_colour]#(whoami)#[fg=$secondary_label_colour]@#[fg=$secondary_fg_colour]#[fg=$alt_fg_colour]#H#[fg=$secondary_label_colour]][#[bg=$primary_bg_colour]#[fg=$secondary_field_value_colour]#S#[fg=$secondary_label_colour]] " 
# Status Right
set -g status-right-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g status-right-length 45
# Window Status Style
set -g window-status-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-current-style bg=$primary_bg_colour,fg=$primary_fg_colour
set -g window-status-separator ''
set -g window-status-activity-style bg=$primary_fg_colour,fg=$primary_bg_colour


