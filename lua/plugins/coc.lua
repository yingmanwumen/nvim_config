return {
  -- coc.nvim
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install",
    config = function()
      vim.cmd[[source ~/.config/nvim/viml/coc/init.vim]]
    end,
    event = "VeryLazy",
    keys = {
      { "<M-e>", "<Cmd>CocCommand explorer --sources file+ --quit-on-open<CR>", silent = true },
      { "<M-v>", "<Cmd>CocOutline<CR>", silent = true                                         },
    }
  }
}
