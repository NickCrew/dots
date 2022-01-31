-- lua/core/options.lua
--
local global = require("core.global")

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.cmd("set " .. k)
    else
      vim.cmd("set " .. k .. "=" .. v)
    end
  end
end

-- stylua: ignore start
local function load_options()
  local global_local = {
    autochdir       = false;
    autoread        = true;
    autowrite       = false;
    backspace       = 'indent,eol,start';
    backup          = false;
    completeopt     = 'menu,menuone,noselect';
    encoding        = 'utf-8';
    errorbells      = false;
    fileformats     = 'unix,dos,mac';
    foldmarker      = '{{{,}}}';
    foldmethod      = 'marker';
    formatoptions   = 'o';
    gdefault        = true;
    hidden          = true;
    hlsearch        = true;
    ignorecase      = true;
    incsearch       = true;
    joinspaces      = false;
    laststatus      = 2;
    linespace       = 0;
    magic           = true;
    modeline        = true;
    mouse           = 'a';
    ruler           = true;
    showcmd         = true;
    showmatch       = true;
    showmode        = true;
    signcolumn      = "auto:1";  --auto auto:2  "number"
    smartcase       = true;
    splitbelow      = true;
    splitright      = true;
    startofline     = false;
    swapfile        = false;
    termguicolors   = true;
    textwidth       = 0;
    undodir         = global.cache_dir .. 'undo/';
    undofile        = true;
    wildignore      = '.git/**,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**';
    wildignorecase  = true;
    wildmenu        = false;
    wildmode        = 'longest,list,full';

  }

  local bw_local    = {
    autoindent      = true;
    expandtab       = true;
    foldenable      = true;
    linebreak       = true;
    shiftwidth      = 4;
    softtabstop     = 4;
    tabstop         = 4;
    wrap            = false;
  }

if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = 0
    }
    vim.g.python3_host_prog = '/usr/local/bin/python3'
  end
  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  bind_option(bw_local)
end

-- stylua: ignore end

load_options()


