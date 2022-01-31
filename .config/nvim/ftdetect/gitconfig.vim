" ftdetect/git.vim
"
augroup det_git
    autocmd!
    autocmd BufEnter .gitignore* set filetype=gitconfig
augroup END
