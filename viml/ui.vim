" let ayucolor="light"
" let ayucolor="dark"
let ayucolor="mirage"

set bg=light
" set bg=dark

" colorscheme tokyonight
" colorscheme onedark
" colorscheme solarized
" colorscheme gruvbox-material
" colorscheme monokai
" colorscheme dracula
colorscheme github_light
" colorscheme ayu
" colorscheme PaperColor

function s:set_transparency()
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
  highlight LineNr ctermbg=none guibg=none
  highlight SignColumn ctermbg=none guibg=none
  highlight VertSplit ctermbg=none guibg=none

  highlight link FloatBorder Normal
  highlight link NormalFloat Normal

  highlight Pmenu ctermbg=none guibg=none
endfunction

" call <SID>set_transparency()

let s:bold = " cterm=bold gui=bold "
let s:italic = " cterm=italic gui=italic "
let s:italic_bold = " cterm=italic,bold gui=italic,bold "
let s:underline = " cterm=underline gui=underline"

exec 'hi @interface' . s:italic
exec 'hi @property' . s:italic
exec 'hi @parameter' . s:italic
exec 'hi @function.builtin' . s:bold

exec 'hi Constant' . s:bold
exec 'hi Statement' . s:italic
exec 'hi String' . s:italic
exec 'hi Type' . s:bold
exec 'hi Boolean' . s:bold
exec 'hi Repeat' . s:bold
exec 'hi Conditional' . s:bold
exec 'hi StorageClass' . s:bold
exec 'hi Structure' . s:bold
exec 'hi Typedef' . s:bold
exec 'hi SpecialComment' . s:bold
exec 'hi Todo' . s:bold
exec 'hi Title' . s:bold
exec 'hi Special' . s:bold
exec 'hi WildMenu' . s:bold

hi! link Keyword Statement
hi! link @conditional Conditional

exec 'hi LspCodeLens' . s:italic
exec 'hi LspDiagnosticsDefaultWarning' . s:bold
exec 'hi LspDiagnosticsDefaultInformation' . s:bold
exec 'hi LspDiagnosticsDefaultHint' . s:bold

""""""""""""""""
" Rust Support "
""""""""""""""""

exec 'hi! @lsp.mod.mutable.rust' . s:underline

"""""""
" zsh "
"""""""
hi link zshFunction Function
hi link zshVariableDef Define

"""""""""""""""
" Lsp Support "
"""""""""""""""
hi! LspInlayHint cterm=nocombine gui=nocombine  guifg=#a4a5a6 guibg=None
