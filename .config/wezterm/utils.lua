local wezterm = require("wezterm")
local func = require("functions")
local colors = require('colors')

local M = {}

function M.load_activation()
  wezterm.on("ActivatePaneDirection-right", function(window, pane)
    func.conditional_activate_pane(window, pane, "Right", "l")
  end)
  wezterm.on("ActivatePaneDirection-left", function(window, pane)
    func.conditional_activate_pane(window, pane, "Left", "h")
  end)
  wezterm.on("ActivatePaneDirection-up", function(window, pane)
    func.conditional_activate_pane(window, pane, "Up", "k")
  end)
  wezterm.on("ActivatePaneDirection-down", function(window, pane)
    func.conditional_activate_pane(window, pane, "Down", "j")
  end)
end

function M.load_tab_title()
  wezterm.on("format-tab-title", function(tab)
    return wezterm.format({
      {
        Attribute = {
          Intensity = "Half",
        },
      },
      {
        Text = string.format(" %s  ", tab.tab_index + 1),
      },
      "ResetAttributes",
      {
        Text = func.get_process(tab),
      },
      {
        Text = " ",
      },
      {
        Text = func.get_current_working_dir(tab),
      },
      {
        Foreground = {
          Color = colors.base,
        },
      },
      {
        Text = "  ▕",
      },
    })
  end)
end

function M.load()
  M.load_activation()
  M.load_tab_title()
end

return M
