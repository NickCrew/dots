" after/ftplugin/python.vim
"
" Behavior
let maplocalleader="\\"

" Formatting
setlocal foldmethod=indent
setlocal cursorcolumn

" Do not wrap Python source code.
set nowrap
set sidescroll=5
set sidescrolloff=2
set colorcolumn=100
	
" Tabs
setlocal tabstop=4 
setlocal softtabstop=4 
setlocal shiftwidth=4
setlocal expandtab

if exists(':AsyncRun')
    nnoremap <buffer><silent> <F9> :<C-U>AsyncRun python -u "%"<CR>
    nnoremap <LocalLeader>r :AsyncRun python %<CR>
endif

if exists(':Neoformat')
    nnoremap <LocalLeader>f :Neoformat autopep8<CR>
endif
