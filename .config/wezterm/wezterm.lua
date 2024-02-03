--
--
local wezterm = require("wezterm")

local f = require("func")

local mappings = require("mappings")

local myfont = wezterm.font("OperatorMono Nerd Font", { weight = "Medium" })

return {
  audible_bell                   = "Disabled",
  automatically_reload_config    = true,
  check_for_updates              = true,
  color_scheme                   = f.set_theme_for_appearance('duskfox', 'dawnfox'),
  enable_scroll_bar              = true,
  enable_wayland                 = false,
  font                           = myfont, 
  font_size                      = 16.5,
  hyperlink_rules                = {
    { regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",      format = "$,0", },
    { regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0", },
    { regex = [[\bfile://\S*\b]],                           format = "$0", },
    { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0", },
    { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0", },
  },
  initial_cols                   = 200,
  initial_rows                   = 35,
  keys                           = mappings,
  leader                         = { key = "g", mods = "SUPER", timeout_millseconds = 1000 },
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
