-- lua/core/theme.lua
--

M = {}

function M.apply_transparent_higlighting()
  vim.cmd([[highlight Normal guibg=none]])
  vim.cmd([[highlight NonText ctermbg=none]])
end

function M.apply_tokyonight_theme(style, term_colors, dark_float, dark_sidebar, italic_funcs, sidebars)
    if style == nil then
      style = 'dark'
    end
    if term_colors == nil then
      term_colors = true
    end
    if dark_float == nil then
      dark_float = true
    end
    if dark_sidebar == nil then
      dark_sidebar = true
    end
    if italic_funcs == nil then
      italic_funcs = true
    end
    if sidebars == nil then
      sidebars = { "vista_kind", "qf", "terminal", "packer" }
    end

    vim.g.tokyonight_style = style
    vim.g.tokyonight_terminal_colors = term_colors
    vim.g.tokyonight_italic_functions = italic_funcs
    vim.g.tokyonight_dark_float = dark_float
    vim.g.tokyonight_dark_sidebar = dark_sidebar
    vim.g.tokyonight_sidebars = sidebars

    vim.cmd([[colorscheme tokyonight]])
end

function M.apply_gruvbox_theme(style, func_style, keyword_style)
  if style == nil then
    style = 'dark'
  end
  if func_style == nil then
    func_style = 'italic'
  end
  if keyword_style == nil then
    keyword_style = 'italic'
  end

  vim.o.background = style 
  vim.o.gruvbox_baby_function_style = func_style
  vim.o.gruvbox_baby_keywork_style = keyword_style
  vim.cmd([[colorscheme gruvbox-baby]])
end

function M.apply_default_theme()
  M.apply_tokyonight_theme()
  M.apply_transparent_higlighting()
end


return M
