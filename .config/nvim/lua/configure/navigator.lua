-- lua/configure/navigator.lua
return {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  }
