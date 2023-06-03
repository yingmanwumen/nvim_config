lua << EOF

vim.g.coc_global_extensions = {
  'coc-bibtex',
  'coc-clangd',
  'coc-cmake',
  'coc-dictionary',
  'coc-docker',
  'coc-explorer',
  'coc-go',
  'coc-highlight',
  'coc-java',
  'coc-json',
  'coc-ltex',
  'coc-lua',
  'coc-marketplace',
  'coc-pairs',
  'coc-pyright',
  'coc-rust-analyzer',
  'coc-sh',
  'coc-syntax',
  'coc-tabnine',
  'coc-tag',
  'coc-toml',
  'coc-tsserver',
  'coc-ultisnips',
  'coc-vetur',
  'coc-vimlsp',
  'coc-vimtex',
  'coc-word',
  'coc-yaml',
}

EOF

let s:coc_config_path = "~/.config/nvim/viml/coc/"

exec "source " . s:coc_config_path . "keymaps.vim"
exec "source " . s:coc_config_path . "autocmds.vim"
