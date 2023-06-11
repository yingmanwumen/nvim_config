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
      "kosayoda/nvim-lightbulb",
      "ray-x/lsp_signature.nvim",
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

  {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = {
          enabled = true,
        }
      })
    end
  },

  { "lvimuser/lsp-inlayhints.nvim" },
  { "p00f/clangd_extensions.nvim" },
  { "antoinemadec/FixCursorHold.nvim" },

  {
    "ray-x/lsp_signature.nvim",
    config = true,
  }
}
