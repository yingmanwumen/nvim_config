" Plugin list
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-dictionary',
  \ 'coc-explorer',
  \ 'coc-json',
  \ 'coc-lua',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-rust-analyzer',
  \ 'coc-syntax',
  \ 'coc-tabnine',
  \ 'coc-ultisnips',
  \ 'coc-vimlsp',
  \ 'coc-word',
  \ 'coc-highlight',
  \ ]

let s:coc_config_path = "~/.config/nvim/viml/coc/"

exec "source " . s:coc_config_path . "keymaps.vim"
exec "source " . s:coc_config_path . "autocmds.vim"
