return {
  'folke/trouble.nvim',
  config = function()
    require('trouble').setup()
    require('keymap').apply_trouble_keymaps()
  end,
}
