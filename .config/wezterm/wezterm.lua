-- vim: set foldmethod=marker

local wezterm = require("wezterm")
local utils = require('utils')

utils.load()

local is_dark = wezterm.gui.get_appearance():find("Dark")
local theme = function()
  return is_dark and 'Tokyo Night Storm (Gogh)' or 'Tokyo Night Light (Gogh)'
end

return {
	font = wezterm.font("SFMono Nerd Font", { weight = "Regular" }),
	font_size = 14,
	leader = {
		key = "a",
		mods = "CTRL|SHIFT",
		timeout_milliseconds = 1000,
	},
	keys = require("mappings"),
	hyperlink_rules = require("link_rules"),
	color_scheme = theme(),
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
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = is_dark and 0.5 or 1.0,
	},
}
