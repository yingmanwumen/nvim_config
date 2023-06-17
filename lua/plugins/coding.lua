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
      require("config.plugins.lspconfig")
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
        },
      })
    end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = true,
  },
  { "p00f/clangd_extensions.nvim" },
  { "antoinemadec/FixCursorHold.nvim" },

  {
    "ray-x/lsp_signature.nvim",
    config = true,
  },

  { "simrat39/rust-tools.nvim" },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    config = function()
      vim.cmd [[let g:rustfmt_autosave = 1]]
    end
  },

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = "SmiteshP/nvim-navic",
    cmd = "Navbuddy",
    keys = {
      { "gn", "<Cmd>Navbuddy<CR>" }
    },
    config = function()
      require("nvim-navbuddy").setup({
        icons = require("config.icons").Kinds,
      })
    end
  },
  { "SmiteshP/nvim-navic" },
}
