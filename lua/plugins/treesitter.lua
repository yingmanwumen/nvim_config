return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    cmd = {
      "TSEnable",
      "TSDisable",
      "TSInstall",
      "TSUpdate",
    },
    config = function()
      require("config.plugins.treesitter")
    end
  },

  -- rainbow
  {
    "HiPhish/nvim-ts-rainbow2",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  }
}
