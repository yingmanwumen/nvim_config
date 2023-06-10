" Enable the experimental Lua module loader
lua vim.loader.enable()
" Load lua configuration
lua require("config")
" Load vimL configuration
source ~/.config/nvim/viml/init.vim
