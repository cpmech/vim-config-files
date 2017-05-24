if exists("b:did_my_py_ftplugin")
	finish
endif
let b:did_my_py_ftplugin = 1

"--- run on save ---------------------------

let g:toggleRunOnSave = 0
function! ToggleRunOnSave(...)
  if a:0 == 1 "do toggle behaviour
    let g:toggleRunOnSave = 1 - g:toggleRunOnSave
    return
  endif
  if g:toggleRunOnSave == 0
    "do nothing
  else
    !python %
  endif
endfunction

autocmd BufWritePost *.py call ToggleRunOnSave()
map <F4> :call ToggleRunOnSave(1)<CR>
