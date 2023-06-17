vim.cmd [[
let g:tex_conceal= 'abdmg'
let g:tex_flavor='latex'
let g:vimtex_compiler_latexmk = {
\  'build_dir': {-> expand("%:t:r")},
\  'options': [
\    '-verbose',
\    '-file-line-error',
\    '-synctex=1',
\    '-interaction=batchmode'
\  ]
\ }
let g:vimtex_compiler_latexmk_engines  = {'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines = {'_':'xelatex'}
let g:vimtex_view_method ='zathura'
let g:vimtex_matchparen_enabled = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_ignore_filters = [
\ 'Underfull',
\ 'Overfull',
\ 'Warning',
\]

setlocal conceallevel=1
]]
