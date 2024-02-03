local wtact = require("wezterm").action

return {
  -- Window size -------------------------------------------------------------------------------------
  { key = "z",          mods = "ALT",              action = wtact.TogglePaneZoomState },
  { key = "F11",        mods = "LEADER",                 action = wtact.ToggleFullScreen },
  -- Adust Font size ---------------------------------------------------------------------------------
  { key = "=",          mods = "CTRL|SHIFT",       action = wtact.IncreaseFontSize },
  { key = "-",          mods = "CTRL|SHIFT",       action = wtact.DecreaseFontSize },
  -- Copy / Paste -----------------------------------------------------------------------------------
  { key = "x",          mods = "LEADER",           action = wtact.ActivateCopyMode },
  { key = "c",          mods = "LEADER",       action = wtact.CopyTo("Clipboard") },
  { key = "v",          mods = "LEADER",       action = wtact.PasteFrom("Clipboard") },
  -- Scroll -----------------------------------------------------------------------------------------
  { key = 'PageDown',   mods = 'SHIFT',            action = wtact.ScrollByPage(1) },
  { key = 'PageUp',     mods = 'SHIFT',            action = wtact.ScrollByPage(-1) },
  -- Adust pane size ---------------------------------------------------------------------------------
  { key = "LeftArrow",  mods = "LEADER", action = wtact.AdjustPaneSize({ "Left", 5 }) },
  { key = "UpArrow",    mods = "LEADER", action = wtact.AdjustPaneSize({ "Up", 5 }) },
  { key = "RightArrow", mods = "LEADER", action = wtact.AdjustPaneSize({ "Right", 5 }) },
  { key = "DownArrow",  mods = "LEADER", action = wtact.AdjustPaneSize({ "Down", 5 }) },
  -- Move between panes -------------------------------------------------------------------------------
  { key = 'k',          mods = 'LEADER',           action = wtact.ActivatePaneDirection 'Up', },
  { key = 'j',          mods = 'LEADER',           action = wtact.ActivatePaneDirection 'Down', },
  { key = 'h',          mods = 'LEADER',           action = wtact.ActivatePaneDirection 'Left', },
  { key = 'l',          mods = 'LEADER',           action = wtact.ActivatePaneDirection 'Right', },
  -- Split panes --------------------------------------------------------------------------------------
  { key = "q",          mods = "LEADER",           action = wtact.CloseCurrentPane({ confirm = false }) },
  { key = "v",          mods = "LEADER",       action = wtact({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "h",          mods = "LEADER",             action = wtact({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  -- Switch tab ---------------------------------------------------------------------------------------
  { key = "1",          mods = "SUPER",            action = wtact({ ActivateTab = 0 }) },
  { key = "2",          mods = "SUPER",            action = wtact({ ActivateTab = 1 }) },
  { key = "3",          mods = "SUPER",            action = wtact({ ActivateTab = 2 }) },
  { key = "4",          mods = "SUPER",            action = wtact({ ActivateTab = 3 }) },
  { key = "5",          mods = "SUPER",            action = wtact({ ActivateTab = 4 }) },
  { key = "6",          mods = "SUPER",            action = wtact({ ActivateTab = 5 }) },
  { key = "7",          mods = "SUPER",            action = wtact({ ActivateTab = 6 }) },
  { key = "8",          mods = "SUPER",            action = wtact({ ActivateTab = 7 }) },
  { key = "9",          mods = "SUPER",            action = wtact({ ActivateTab = 8 }) },
  -- Launcher ------------------------------------------------------------------------------------------
  { key = "l",          mods = "LEADER",            action = wtact.ShowLauncher },
  { key = '9',          mods = 'LEADER',              action = wtact.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
  -- Switch Workspaces ---------------------------------------------------------------------------------
  { key = ']',          mods = 'LEADER',           action = wtact.SwitchWorkspaceRelative(1) },
  { key = '[',          mods = 'LEADER',           action = wtact.SwitchWorkspaceRelative(-1) }
}
