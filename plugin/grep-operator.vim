" nnoremap <silent> <Leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <Leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <Leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_yank = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif
  silent execute "grep! -R ". shellescape(@@) . " ."
  copen

  let @@ = saved_yank
endfunction
