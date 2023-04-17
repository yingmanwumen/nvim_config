return {
  -- startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function ()
      vim.g.startuptime_tries = 10
    end
  },

  -- library for other plugins
  { "nvim-lua/plenary.nvim" },

  -- repeat
  { "tpope/vim-repeat",
    event = {
      "BufNewFile",
      "BufReadPost"
    },
  },

  -- fzf
  {
    "junegunn/fzf",
    cmd = "FZF",
    enabled = false
  },
}
