augroup fcitx_group
  autocmd!
  autocmd InsertLeave * :silent !fcitx5-remote -c
  autocmd BufCreate *   :silent !fcitx5-remote -c
  autocmd BufEnter *    :silent !fcitx5-remote -c
  autocmd BufLeave *    :silent !fcitx5-remote -c
augroup END

function s:autosave()
  augroup my_group
    autocmd InsertLeave <buffer> silent write
    autocmd TextChanged <buffer> silent write
  augroup END
endfunction

function s:set_indent_width(width, is_expand)
  execute 'setlocal tabstop=' . a:width
  execute 'setlocal shiftwidth=' . a:width
  if a:is_expand
    setlocal expandtab
  else
    setlocal noexpandtab
  endif
endfunction

function s:set_markdown_keymap()
  inoremap <C-b> ****<LEFT><LEFT>
endfunction

augroup MyAutoCmd
  autocmd!
  autocmd BufNewFile,BufRead *.cl  setlocal filetype=opencl
  autocmd BufNewFile,BufRead *.typ setlocal filetype=typst
  autocmd FileType cpp,cmake,cuda call <SID>set_indent_width(4, v:true)
  autocmd FileType c,go call <SID>set_indent_width(8, v:false)
  autocmd FileType latex,plaintex,tex,markdown call <SID>autosave() | setlocal conceallevel=1 | call <SID>set_indent_width(2, v:true)
  autocmd FileType markdown call <SID>set_markdown_keymap()
augroup END
