return {
  'puremourning/vimspector',
  config = function()
    local g = vim.g
    local fn = vim.fn
    g.vimspector_enable_mappings = 'HUMAN'
    g.vimspector_base_dir = fn.stdpath('config')..'/vimspector'
    g.vimspector_install_gadgets = {
        'debugpy',
        'vscode-node-debug2',
        'vscode-firefox-debug',
        'lua',
        'CodeLLDB',
        'vscode-bash-debug',
        'local-lua-debugger-vscode'
    }
    require('keymap').apply_vimspector_keymaps()
  end
}
