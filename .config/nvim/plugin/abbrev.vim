" plugin/abbrev.vim
"
fu! Single_quote(str)
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfu
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
endfu

" Ask to expand abbrevation
function! s:Ask(abbr,expansion,defprompt)
  let answer = confirm("Expand '" . a:abbr . "'?", "&Yes\n&No", a:defprompt)
  " testing against 1 and not 2, I correctly take care of <abort>
  return answer == 1 ? a:expansion : a:abbr
endfunction
" EXAMPLE: iabbrev <expr> for <SID>Ask('for', "for () {\n}", 2)

cnoreabbrev T Telescope
cnoreabbrev Tr TroubleToggle
cnoreabbrev PC PackerCompile
cnoreabbrev PI PackerInstall

