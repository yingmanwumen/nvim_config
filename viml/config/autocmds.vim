" Switch fcitx5 input mode
augroup fcitx_group
  autocmd!
  autocmd InsertLeave * :silent !fcitx5-remote -c
  autocmd BufCreate *   :silent !fcitx5-remote -c
  autocmd BufEnter *    :silent !fcitx5-remote -c
  autocmd BufLeave *    :silent !fcitx5-remote -c
augroup END

""""""""""""""""""""""
"  Enable Auto Save  "
""""""""""""""""""""""
function s:autosave()
  augroup my_group
    autocmd InsertLeave <buffer> silent write
    autocmd TextChanged <buffer> silent write
  augroup END
endfunction

function s:set_indent_width(width, is_expand)
  execute 'setlocal tabstop=' . a:width
  execute 'setlocal shiftwidth=' . a:width
  " setlocal tabstop=a:width
  " setlocal shiftwidth=a:width
  if a:is_expand
		setlocal expandtab
	else
		setlocal noexpandtab
	endif
endfunction

augroup my_group
  autocmd!
  autocmd BufNewFile,BufRead *.cl  setlocal filetype=opencl
  autocmd BufNewFile,BufRead *.typ setlocal filetype=typst

  autocmd FileType markdown call <SID>autosave()

  autocmd FileType cpp,cmake,opencl call <SID>set_indent_width(4, v:true)
  autocmd FileType c,go             call <SID>set_indent_width(8, v:false)

  autocmd FileType cpp,opencl autocmd BufWritePost * silent call <SID>format_cpp()
  autocmd FileType c          autocmd BufWritePost * silent call <SID>format_c()
augroup END

function s:format_cpp()
  " LLVM|Google|Chromium|Microsoft|Mozilla|WebKit
  let style = "llvm"
  let indent_width = 4
  if &filetype == 'cpp' || &filetype == 'opencl'
    execute "!" .
      \'clang-format -i ' . bufname('%') .
      \' -style="{BasedOnStyle: ' . style .
      \', IndentWidth: ' . indent_width . '}"'
    execute "e"
  endif
endfunction

function s:format_c()
  let style = "--linux-style"
  let fname = bufname('%')
  if &filetype == 'c'
    execute "!".
      \'indent ' . style .
      \' ' . fname . ' -o ' . fname
    execute "e"
  endif
endfunction

