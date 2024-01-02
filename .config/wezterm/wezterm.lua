--
--
local wezterm = require("wezterm")
local wtact = wezterm.action

-- So I don't have to scroll so far
local settings = {
  font = {
    name = "OperatorMono Nerd Font",
    size = 16.5,
    weight = "Medium"
  },
  leader = { key = "a", mods = "SUPER", timeout_millseconds = 1000 }
}

--
-- Theme based on system appearance
--
-- local dark_theme = 'Tokyo Night Storm (Gogh)'
-- local light_theme = 'Tokyo Night Day'
local dark_theme = 'rose-pine'
local light_theme = 'rose-pine-dawn'

local is_dark = wezterm.gui.get_appearance():find("Dark")
local function _get_theme_for_appearance()
  return is_dark and dark_theme or light_theme
end

--
-- Seamless vi pane navigation
--
local function _is_vi_process(pane)
  return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
  if _is_vi_process(pane) then
    window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "CTRL" }), pane)
  else
    window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
  conditional_activate_pane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
  conditional_activate_pane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
  conditional_activate_pane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
  conditional_activate_pane(window, pane, "Down", "j")
end)

local font = {
  font = wezterm.font(settings.font.name, { weight = settings.font.weight }),
  size = 16.5
}


--
-- Settings
--
return {
  audible_bell                   = "Disabled",
  automatically_reload_config    = true,
  check_for_updates              = true,
  color_scheme                   = _get_theme_for_appearance(),
  enable_scroll_bar              = true,
  enable_wayland                 = false,
  font                           = font.font,
  font_size                      = font.size,
  hyperlink_rules                = {
    { regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",      format = "$,0", },
    { regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0", },
    { regex = [[\bfile://\S*\b]],                           format = "$0", },
    { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0", },
    { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0", },
  },
  initial_cols                   = 200,
  initial_rows                   = 35,
  keys                           = {
    { key = "q",        mods = "LEADER",      action = wtact.CloseCurrentPane({ confirm = false }) },
    { key = "z",        mods = "ALT",         action = wtact.TogglePaneZoomState },
    { key = "F11",      mods = "",            action = wtact.ToggleFullScreen },
    { key = "c",        mods = "LEADER",      action = wtact.ActivateCopyMode },
    { key = "=",        mods = "CTRL|SHIFT",  action = wtact.IncreaseFontSize },
    { key = "-",        mods = "CTRL|SHIFT",  action = wtact.DecreaseFontSize },
    { key = "c",        mods = "CTRL|SHIFT",  action = wtact.CopyTo("Clipboard") },
    { key = "v",        mods = "CTRL|SHIFT",  action = wtact.PasteFrom("Clipboard") },
    { key = 'PageDown', mods = 'SHIFT',       action = wtact.ScrollByPage(1) },
    { key = 'PageUp',   mods = 'SHIFT',       action = wtact.ScrollByPage(-1) },
    { key = "h",        mods = "CTRL|SHIFT",  action = wtact.AdjustPaneSize({ "Left", 5 }) },
    { key = "k",        mods = "CTRL|SHIFT",  action = wtact.AdjustPaneSize({ "Up", 5 }) },
    { key = "l",        mods = "CTRL|SHIFT",  action = wtact.AdjustPaneSize({ "Right", 5 }) },
    { key = "j",        mods = "CTRL|SHIFT",  action = wtact.AdjustPaneSize({ "Down", 5 }) },
    { key = 'h',        mods = 'SUPER|SHIFT', action = wtact.ActivatePaneDirection 'Left', },
    { key = 'l',        mods = 'SUPER|SHIFT', action = wtact.ActivatePaneDirection 'Right', },
    { key = 'k',        mods = 'SUPER|SHIFT', action = wtact.ActivatePaneDirection 'Up', },
    { key = 'j',        mods = 'SUPER|SHIFT', action = wtact.ActivatePaneDirection 'Down', },
    { key = "|",        mods = "CTRL|SHIFT",  action = wtact({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "-",        mods = "CTRL",        action = wtact({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "1",        mods = "SUPER",       action = wtact({ ActivateTab = 0 }) },
    { key = "2",        mods = "SUPER",       action = wtact({ ActivateTab = 1 }) },
    { key = "3",        mods = "SUPER",       action = wtact({ ActivateTab = 2 }) },
    { key = "4",        mods = "SUPER",       action = wtact({ ActivateTab = 3 }) },
    { key = "5",        mods = "SUPER",       action = wtact({ ActivateTab = 4 }) },
    { key = "6",        mods = "SUPER",       action = wtact({ ActivateTab = 5 }) },
    { key = "7",        mods = "SUPER",       action = wtact({ ActivateTab = 6 }) },
    { key = "8",        mods = "SUPER",       action = wtact({ ActivateTab = 7 }) },
    { key = "9",        mods = "SUPER",       action = wtact({ ActivateTab = 8 }) },
    { key = "l",        mods = "SUPER",       action = wtact.ShowLauncher },
    { key = '9',        mods = 'ALT',         action = wtact.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
    { key = ']',        mods = 'SUPER|SHIFT', action = wtact.SwitchWorkspaceRelative(1) },
    { key = '[',        mods = 'SUPER|SHIFT', action = wtact.SwitchWorkspaceRelative(-1) }
  },
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
