vim.notify = require("notify")
vim.notify.setup({
  render = "minimal",
  top_down = false
})

-- LSP support is implemented in coc.nvim
-- intergrate with coc.nvim
vim.cmd[[source ~/.config/nvim/viml/coc/notify.vim]]
