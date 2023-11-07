--
--
local wezterm = require("wezterm")

local settings = require("settings")


return {
  audible_bell                   = "Disabled",
  automatically_reload_config    = true,
  check_for_updates              = true,
  color_scheme                   = settings.theme(),
  enable_scroll_bar              = true,
  enable_wayland                 = false,
  font                           = wezterm.font(settings.font.name, { weight = settings.font.weight }),
  font_size                      = settings.font.size,
  hyperlink_rules                = settings.links,
  initial_cols                   = 200,
  initial_rows                   = 35,
  keys                           = settings.keybindings,
  leader                         = settings.leader,
  line_height                    = 1.20,
  max_fps                        = 60,
  pane_focus_follows_mouse       = false,
  scrollback_lines               = 100000,
  show_new_tab_button_in_tab_bar = true,
  show_update_window             = true,
  tab_bar_at_bottom              = false,
  tab_max_width                  = 100,
  use_dead_keys                  = false,
  use_fancy_tab_bar              = true,
  warn_about_missing_glyphs      = true,
  window_background_opacity      = 1.0,
  window_close_confirmation      = "NeverPrompt",
  window_decorations             = "RESIZE",
  window_padding                 = { left = 10, right = 10, top = 10, bottom = 10 },
}
