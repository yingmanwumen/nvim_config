return {
  { "SmiteshP/nvim-navic" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "simrat39/rust-tools.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

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
      "yingmanwumen/litee-calltree.nvim",
    },
    config = function()
      require("config.plugins.lspconfig")
    end,
  },

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
        ignore = {
          "null-ls",
        }
      })
    end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = true,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = true,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    dependencies = "mattn/webapi-vim",
    config = function()
      vim.cmd([[let g:rustfmt_autosave = 1]])
    end,
  },

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = "SmiteshP/nvim-navic",
    cmd = "Navbuddy",
    keys = {
      { "gn", "<Cmd>Navbuddy<CR>" },
    },
    config = function()
      require("nvim-navbuddy").setup({
        icons = require("config.icons").Kinds,
      })
    end,
  },

  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    config = true,
  },

  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    keys = {
      { "<M-c>", "<Cmd>call codeium#Clear()<CR>", mode = "i" },
      {
        "<C-CR>",
        "codeium#Accept()",
        mode = "i",
        nowait = true,
        expr = true,
        silent = true,
        script = true,
      },
    },
    config = function()
      vim.cmd([[
        let g:codeium_filetypes = { 'markdown': v:false }
      ]])
    end,
  },

  {
    "ldelossa/litee.nvim",
    config = function()
      require("litee.lib").setup({})
    end,
  },

  {
    "yingmanwumen/litee-calltree.nvim",
    dependencies = "ldelossa/litee.nvim",
    config = function()
      require("litee.calltree").setup({
        no_hls = true,
        on_open = "popout",
        keymaps = {
          expand = "o",
          collapse = "f",
          hover = "K",
          close = "q",
        },
        icon_set_custom = require("config.icons").Kinds,
      })
    end,
    enabled = false,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.code_actions.gitsigns.with({
            config = {
              filter_actions = function(title)
                return title:lower():match("blame") == nil -- filter out blame actions
              end,
            },
          }),
          null_ls.builtins.diagnostics.cpplint.with({
            args = {
              "--filter=-legal/copyright",
              "$FILENAME"
            },
          }),
        },
      })
    end,
  },
}
