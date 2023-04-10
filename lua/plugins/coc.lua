return {
  -- coc.nvim
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install",
    config = function()
      vim.cmd[[source ~/.config/nvim/viml/coc/init.vim]]
    end,
    event = "VeryLazy"
  }
}
