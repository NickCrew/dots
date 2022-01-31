local M = {}

local functions = require('keymap.functions')
local vim = vim

local function bind(keymaps)
  for _, keymap in pairs(keymaps) do
    local opts = keymap.opts or {}
    if opts.silent == nil then
      opts.silent = true
    end
    if opts.noremap == nil then
      opts.noremap = true
    end
    vim.keymap.set(keymap.mode or 'n', keymap[1], keymap[2], opts)
  end
end

function M.apply_default_keymaps()
  bind({
    -- Fast quit buffer
    {'zz', ':q'},
    {'ZZ', ':q!'},

    -- ctrl+y and ctrl+u to resize splits
    { '<leader><leader><up>', functions.resize_split('plus') },
    { '<leader><leader><down>', functions.resize_split('minus') },

    -- remap gx to open url under cursor since I have netrw disabled
    { 'gx', functions.open_url_under_cursor },

    -- Navigator.nvim
    { '<C-h>', functions.navigator_lazy('left') },
    { '<C-j>', functions.navigator_lazy('down') },
    { '<C-k>', functions.navigator_lazy('up') },
    { '<C-l>', functions.navigator_lazy('right') },

    -- Fast escape from terminal
    { '<C-[><C-[>', '<C-\\><C-n>', mode = 't' },
    { '<C-e>t', ':split term://zsh'},

    -- Bufferline
    {'<leader><tab>', ':b#<CR>'},
    { '<leader>n', ':BufferLineCycleNext<CR>' },
    { '<leader>p', ':BufferLineCyclePrev<CR>' },

    -- Search
    { '<leader>,', ':noh<CR>'},
    {'n', 'nzz'},
    {'N', 'Nzz'},

    -- Show hide info
    {'<C-e>o', ':copen<CR>'},
    {'<C-e>c', ':close<CR>'},
    {'<leader>r', ':reg<CR>'},
    {'<leader>m', ':marks<CR>'},

    -- Yank/Paste
    {'<C-e>p', ':set paste<CR>'},
    {'<C-e>P', ':set nopaste<CR>'},
    {'<leader>p', ':r !pbpaste<CR>'},
    {'<leader>c', ':%w !pbcopy<CR>'},
    {'<leader>y', '"*y'},
    {'<leader>Yb', ':%y*'},
    {'<leader>P', '"0p'},
    {'<leader>dP', '"_dd'},
    {'<leader>gy', 'm`^yg_``'},

    -- vim-sneak
    {'m', '<Plug>Sneak_s'},
    {'M', '<Plug>Sneak_S'},
    -- cheatsheet
    {'<leader>cs', ':Cheatsheet<CR>'},
    -- Toggle LSP Diagnostics
    {'<leader>TD', ':ToggleDiag<CR>'},
    -- NvimTree
    { '<C-n>', ':NvimTreeToggle<CR>' },
    -- Blamer
    {'<C-e>b', ':BlamerToggle<CR>'},
    -- Vista
    {'<C-e>v',  ':Vista!!<CR>'},

  })
end

function M.apply_telescope_keymaps()
  bind({
    { '<leader>ff', functions.telescope_lazy('find_files') },
    { '<leader>fp', ':Telescope projects<CR>'},
    { '<leader>b', functions.telescope_lazy('buffers') },
    { '<leader>lg', functions.telescope_lazy('live_grep') },
    { '<leader><leader>d', ':Telescope dap commands<CR>'},
    { '<leader><leader>z', ':Telescope zoxide list<CR>'}
  })
end

function M.apply_dap_keymaps()
  bind({
    {'<leader><leader>b', ":lua require('dap').toggle_breakpoint()<CR>"},
    {'<leader><leader>rp', ":lua require('dap').repl.open()<CR>"},
    {'<leader><leader>c', ":lua require('dap').continue()<CR>"},
   {'<leader><leader>so', ":lua require('dap').step_over()<CR>"},
   {'<leader><leader>si', ":lua require('dap').step_in()<CR>"},
   {'<leader><leader>sot', ":lua require('dap').step_out()<CR>"},
   {'<leader><leader>cb', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"},
   {'<leader><leader>lb', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"}

  })
end

function M.apply_trouble_keymaps()
  bind({
    -- Trouble
    {'<leader>xx', '<cmd>TroubleToggle<cr>'},
    {'<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>'},
    {'<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>'},
    {'<leader>xq', '<cmd>TroubleToggle quickfix<cr>'},
    {'<leader>xl', '<cmd>TroubleToggle loclist<cr>'},
    {'<leader>gR', '<cmd>TroubleToggle lsp_references<cr>'},
    })
  end


function M.apply_vimspector_keymaps()
  bind({
    -- Vimspector
    {'<Leader>vs', '<Plug>VimspectorStepOver'},
    {'<Leader>vsi', '<Plug>VimspectorStepInto'},
    {'<Leader>vso', '<Plug>VimspectorStepOut'},
    {'<Leader>vdi', '<Plug>VimspectorBalloonEval'},
    {'<Leader>vu', '<Plug>VimspectorUpFrame'},
    {'<Leader>vd', '<Plug>VimspectorDownFrame'},
    {'<Leader>vb', ':call vimspector#ToggleBreakpoint()<CR>'},
    {'<Leader>vcb', ':call vimspector#ClearBreakpoints()<CR>'},
    {'<Leader>vr', ':call vimspector#Reset()<CR>'},
  })
end

function M.apply_lsp_keymaps()
  bind({
    { 'gd', vim.lsp.buf.definition },
    { '<leader>k', vim.lsp.buf.hover },
    { 'gt', vim.lsp.buf.type_definition },
    { 'gs', vim.lsp.buf.signature_help },
    { 'gr', vim.lsp.buf.references },
    { '<leader>gi', vim.lsp.buf.implementation },
    { '<leader>rn', vim.lsp.buf.rename },
    { '<leader>ca', vim.lsp.buf.code_action },
    { '<leader>[', vim.diagnostic.goto_prev },
    { '<leader>]', vim.diagnostic.goto_next },
    
  })
end


function M.get_cmp_mappings()
  return {
    ['<C--p>'] = require('cmp').mapping.select_prev_item(),
    ['<C-n>'] = require('cmp').mapping.select_next_item(),
    ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space'] = require('cmp').mapping.complete({'i','c'}),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
  }
end

return M
