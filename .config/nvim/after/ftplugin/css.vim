"""""""""""""""""""""""""""
""""" CSS FileType Settings
"""""""""""""""""""""""""""

""" Text formatting
set textwidth=80

set tabstop=2 
set softtabstop=2 
set shiftwidth=2 
set expandtab


""" Prettier Settings
"""""""""""""""""""""

" auto formatting
" if disabled, will run on save

" let g:prettier#autoformat = 1

" run prettier async 
let g:prettier#exec_cmd_async = 1

" parsing errors opens quickfix window
" disable if this if you enable autoformat
" let g:prettier#quickfix_enabled = 0

" auto focus on the quickfix window when there are errors
" let g:prettier#quickfix_auto_focus = 0

" Use tabs or spaces
" default = false
" let g:prettier#config#use_tabs = 'false'

" Tab width
" default = 2
" let g:prettier#config#tab_width = 2

" Print width
" default = 80
" let g:prettier#config#print_width = 80

" Print semi-colons
" default = true
" let g:prettier#config#semi = 'true'

" Print space between brackets
" default = false
" let g:prettier#config#bracket_spacing = 'true'

" css | strict | ignore
" let g:prettier#config#html_whitespace_sensitivity = 'css'


