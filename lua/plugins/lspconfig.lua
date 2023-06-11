return {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      "lvimuser/lsp-inlayhints.nvim",
    },
    config = function()
      require("config.plugins.nvim-lspconfig")
    end,
  },

  { "williamboman/mason-lspconfig.nvim" },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },

  { "lvimuser/lsp-inlayhints.nvim" },
  { "p00f/clangd_extensions.nvim" }
}
