local fn = vim.fn
local packer_bootstrap = false
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  -- Manage Startup and Launch
  use { 'lewis6991/impatient.nvim', 'dstein64/vim-startuptime' }
  -- Reload neovim
  use { 'famiu/nvim-reload' }
  -- Debuggers
  use(require('configure.vimspector'))
  use(require('configure.dapinstall'))
  -- Language Support
  use(require('configure.lspconfig'))
  use(require('configure.treesitter'))
  -- Diagnostics
  use(require('configure.trouble'))
  -- Search
  use(require('configure.telescope'))
  -- Completion
  use(require('configure.completion'))
  -- Git integration
  use(require('configure.git'))
  -- File drawer
  use(require('configure.nvim-tree'))
  -- Indent guides
  use(require('configure.indent-blankline'))
  -- Fancy status bar
  use(require('configure.lualine'))
  -- Buffer management and bar
  use(require('configure.bufferline'))
  -- Show inline color labels
  use(require('configure.colorizer'))
  -- Enhanced comments
  use(require('configure.todo-comments'))
  -- Nice notifications
  use(require('configure.nvim-notify'))
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- Move code easily
  use(require('configure.vim-move'))
  -- Keybinding helper
  use(require('configure.which-key'))
  -- Better quickfix window
  use{'kevinhwang91/nvim-bqf'}
  -- Movement
  use { 'chaoren/vim-wordmotion', 'justinmk/vim-sneak' }
  -- Formatting
  use('sbdchd/neoformat')
  -- Easy commenting
  use('tpope/vim-commentary')
  -- Improved history with tree-style viewer
  use('simnalamburt/vim-mundo')
  -- Better pane navigation
  use(require('configure.navigator'))
  -- Help Remember stuff
  use {
    'sudormrfbin/cheatsheet.nvim',
    config = function()
      require('cheatsheet').setup()
    end
  }
  -- Project manager
  use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  -- Wrapping/delimiters
  use {
    'machakann/vim-sandwich',
    {'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({})
      end
    }
  }
  -- Generate docs
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
        require('neogen').setup {
            enabled = true
        }
    end
  }
  -- Smooth Scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function ()
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
    end,
  }
  -- Markdown
  use {
    'ellisonleao/glow.nvim',
    config = function()
      vim.g.glow_binary_path = vim.env.HOME .. "/bin"
    end
  }
  -- Tags and symbols
  use { 'liuchengxu/vista.vim', 'ludovicchabant/vim-gutentags' }
  -- Themes
  use(require('configure.themes'))

  if packer_bootstrap then
    require('packer').sync()
  end
end)
