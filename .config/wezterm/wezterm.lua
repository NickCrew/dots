-- vim: set foldmethod=marker

local wezterm = require("wezterm")
local act = wezterm.action

local colo = {
  light = 'Rosé Pine Moon (Gogh)',
  dark = 'Rosé Pine Dawn (Gogh)'
}

local is_dark = wezterm.gui.get_appearance():find("Dark")
local scheme_for_appearance = function()
  return is_dark and colo.light or colo.dark
end

return {
  font                           = wezterm.font("SFMono Nerd Font"),
  font_size                      = 16,
  color_scheme                   = scheme_for_appearance(),
  leader                         = {
    key = "g",
    mods = "CTRL",
    timeout_milliseconds = 1000,
  },
  use_dead_keys                  = false,
  line_height                    = 1.25,
  enable_scroll_bar              = false,
  initial_cols                   = 110,
  scrollback_lines               = 10000,
  initial_rows                   = 35,
  pane_focus_follows_mouse       = false,
  warn_about_missing_glyphs      = true,
  show_update_window             = true,
  automatically_reload_config    = true,
  check_for_updates              = true,
  max_fps                        = 60,
  tab_bar_at_bottom              = false,
  use_fancy_tab_bar              = true,
  show_new_tab_button_in_tab_bar = true,
  tab_max_width                  = 50,
  enable_wayland                 = false,
  window_background_opacity      = 1.0,
  window_decorations             = "RESIZE",
  window_close_confirmation      = "NeverPrompt",
  audible_bell                   = "Disabled",
  window_padding                 = {
    left = 1,
    right = 1,
    top = 1,
    bottom = 1,
  },
  inactive_pane_hsb              = {
    saturation = 1.0,
    brightness = is_dark and 0.65 or 1.0,
  },
  hyperlink_rules                = {
    { regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",      format = "$0", },
    { regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0", },
    { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0", },
    { regex = [[\bfile://\S*\b]],                           format = "$0", },
    { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0", },
    { regex = [[\bPENG\-(\d+)\b]],                          format = "https://threatx.atlassian.net/browse/$0", },
    { regex = [[\bthreatx\-(\w+)]],                         format = "https://github.com/ThreatX/$0" }
  },
  keys                           = {
    { key = "q",        mods = "LEADER",       action = act.CloseCurrentPane({ confirm = false }) },
    { key = "z",        mods = "ALT",          action = act.TogglePaneZoomState },
    { key = "F11",      mods = "",             action = act.ToggleFullScreen },
    { key = "c",        mods = "LEADER",       action = act.ActivateCopyMode },
    { key = "=",        mods = "CTRL|SHIFT",   action = act.IncreaseFontSize },
    { key = "-",        mods = "CTRL|SHIFT",   action = act.DecreaseFontSize },
    { key = "c",        mods = "CTRL|SHIFT",   action = act.CopyTo("Clipboard") },
    { key = "v",        mods = "CTRL|SHIFT",   action = act.PasteFrom("Clipboard") },
    { key = 'PageDown', mods = '',             action = act.ScrollByPage(1) },
    { key = 'PageUp',   mods = '',             action = act.ScrollByPage(-1) },
    { key = "h",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 4 }) },
    { key = "j",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },
    { key = "k",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "l",        mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = 'h',        mods = 'LEADER',       action = act.ActivatePaneDirection 'Left', },
    { key = 'l',        mods = 'LEADER',       action = act.ActivatePaneDirection 'Right', },
    { key = 'k',        mods = 'LEADER',       action = act.ActivatePaneDirection 'Up', },
    { key = 'j',        mods = 'LEADER',       action = act.ActivatePaneDirection 'Down', },
    { key = "|",        mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "-",        mods = "LEADER|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "1",        mods = "SUPER",        action = act({ ActivateTab = 0 }) },
    { key = "2",        mods = "SUPER",        action = act({ ActivateTab = 1 }) },
    { key = "3",        mods = "SUPER",        action = act({ ActivateTab = 2 }) },
    { key = "4",        mods = "SUPER",        action = act({ ActivateTab = 3 }) },
    { key = "5",        mods = "SUPER",        action = act({ ActivateTab = 4 }) },
    { key = "6",        mods = "SUPER",        action = act({ ActivateTab = 5 }) },
    { key = "7",        mods = "SUPER",        action = act({ ActivateTab = 6 }) },
    { key = "8",        mods = "SUPER",        action = act({ ActivateTab = 7 }) },
    { key = "9",        mods = "SUPER",        action = act({ ActivateTab = 8 }) },
    { key = "l",        mods = "SUPER",        action = act.ShowLauncher },
    { key = '9',        mods = 'ALT',          action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
    { key = 'n',        mods = 'ALT',          action = act.SwitchWorkspaceRelative(1) },
    { key = 'p',        mods = 'ALT',          action = act.SwitchWorkspaceRelative(-1) },
  },
}
