
local wezterm = require("wezterm")
local act     = wezterm.action
local icons   = require('icons')
local colors = require('colors')



-- Seamless vi pane navigation {{{
local function _is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end


local M = {}

function M.conditional_activate_pane(window, pane, pane_direction, vim_direction)
	if _is_vi_process(pane) then
		window:perform_action(act.SendKey({
            key = vim_direction,
            mods = "ALT" }),
            pane)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

function M.get_process(tab)
	local process_icons = icons
	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = colors.sky } }, { Text = string.format("[%s]", process_name) } }
	)
end

function M.get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "   ~"
		or string.format("   %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end



return M
