return {
  'neovim/nvim-lspconfig',
  requires = {
    'ray-x/lsp_signature.nvim',
    'williamboman/nvim-lsp-installer',
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    'folke/lsp-colors.nvim',
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  },
  config = function()
    require('lsp')
  end,
}
