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
  augroup auto_save
    autocmd!
    autocmd InsertLeave <buffer> silent write
    autocmd TextChanged <buffer> silent write
  augroup END
endfunction

augroup filetype_group
  autocmd!
  autocmd FileType markdown call <SID>autosave()
  autocmd FileType sh,vim,markdown,json,xml,typescript,lua setlocal ts=2 | setlocal sw=2
  autocmd FileType cpp,cmake,opencl setlocal ts=4 | setlocal sw=4
  autocmd FileType c,go setlocal ts=8 | setlocal sw=8 | setlocal noexpandtab
  autocmd FileType c,cpp,rust,python,opencl setlocal colorcolumn=81
  autocmd BufNewFile,BufRead *.cl setlocal filetype=opencl
  autocmd FileType cpp,opencl call <SID>enable_cpp_format()
  autocmd FileType c call <SID>enable_c_format()
augroup END

"""""""""""""""""""""
"  Format Cpp Code  "
"""""""""""""""""""""
function s:enable_cpp_format()
  augroup auto_format
    autocmd!
    autocmd BufWritePost * silent call <SID>format_cpp()
  augroup END
endfunction

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

"""""""""""""""""""
"  Format C Code  "
"""""""""""""""""""
function s:enable_c_format()
  augroup auto_format
    autocmd!
    autocmd BufWritePost * silent call <SID>format_c()
  augroup END
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

