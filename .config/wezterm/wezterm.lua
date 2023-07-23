-- vim: set foldmethod=marker

local wezterm = require("wezterm")
local act = wezterm.action

local is_dark = wezterm.gui.get_appearance():find("Dark")

local function theme() 
  return is_dark and 'Tokyo Night Storm (Gogh)' or 'Tokyo Night Light (Gogh)'
end

return {
	font = wezterm.font("SFMono Nerd Font", { weight = "Regular" }),
	font_size = 16,
	color_scheme = "Tokyo Night Storm (Gogh)",
	leader = {
		key = "a",
		mods = "CTRL|SHIFT",
		timeout_milliseconds = 1000,
	},
	line_height = 1.25,
	enable_scroll_bar = false,
	initial_cols = 110,
	initial_rows = 25,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = true,
	show_update_window = true,
	check_for_updates = true,
	max_fps = 60,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	show_new_tab_button_in_tab_bar = true,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = false,
	disable_default_key_bindings = false,
	enable_wayland = false,
	window_background_opacity = 1.0,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	audible_bell = "Disabled",
	window_padding = {
		left = 1,
		right = 1,
		top = 1,
		bottom = 1,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = is_dark and 0.5 or 1.0,
	},
	hyperlink_rules = {
      { regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",      format = "$0", },
      { regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0", },
      { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0", },
      { regex = [[\bfile://\S*\b]],                           format = "$0", },
      { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0", },
      { regex = [[\b[tT](\d+)\b]],                            format = "https://example.com/tasks/?t=$1", },
  },
	keys = {
		{ key = "q",          mods = "ALT",           action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "z",          mods = "ALT",           action = act.TogglePaneZoomState },
        { key = "F11",        mods = "",              action = act.ToggleFullScreen },
		{ key = "v",          mods = "ALT",           action = act.ActivateCopyMode },
		{ key = "c",          mods = "CTRL|SHIFT",    action = act.CopyTo("Clipboard")},
		{ key = "v",          mods = "CTRL|SHIFT",    action = act.PasteFrom("Clipboard")},
		{ key = "=",          mods = "CTRL",          action = act.IncreaseFontSize },
		{ key = "-",          mods = "CTRL",          action = act.DecreaseFontSize },
		{ key = "h",          mods = "ALT",           action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j",          mods = "ALT",           action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k",          mods = "ALT",           action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l",          mods = "ALT",           action = act.AdjustPaneSize({ "Right", 1 }) },
        { key = 'LeftArrow',  mods = 'SUPER',         action = act.ActivatePaneDirection 'Left', },
        { key = 'RightArrow', mods = 'SUPER',         action = act.ActivatePaneDirection 'Right', },
        { key = 'UpArrow',    mods = 'SUPER',         action = act.ActivatePaneDirection 'Up', },
        { key = 'DownArrow',  mods = 'SUPER',         action = act.ActivatePaneDirection 'Down', },
        { key = 'PageDown',   mods = 'SHIFT',         action = act.ScrollByPage(1)},
        { key = 'PageUp',     mods = 'SHIFT',         action = act.ScrollByPage(-1)},
		{ key = "1",          mods = "SUPER",         action = act({ ActivateTab = 0 }) },
		{ key = "2",          mods = "SUPER",         action = act({ ActivateTab = 1 }) },
		{ key = "3",          mods = "SUPER",         action = act({ ActivateTab = 2 }) },
		{ key = "4",          mods = "SUPER",         action = act({ ActivateTab = 3 }) },
		{ key = "5",          mods = "SUPER",         action = act({ ActivateTab = 4 }) },
		{ key = "6",          mods = "SUPER",         action = act({ ActivateTab = 5 }) },
		{ key = "7",          mods = "SUPER",         action = act({ ActivateTab = 6 }) },
		{ key = "8",          mods = "SUPER",         action = act({ ActivateTab = 7 }) },
		{ key = "9",          mods = "SUPER",         action = act({ ActivateTab = 8 }) },
        { key = "l",          mods = "SUPER",         action = act.ShowLauncher },
        { key = '9',          mods = 'ALT',           action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
        { key = 'n',          mods = 'ALT',           action = act.SwitchWorkspaceRelative(1) },
        { key = 'p',          mods = 'ALT',           action = act.SwitchWorkspaceRelative(-1) },
},
}
