return {
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
      -- "lvimuser/lsp-inlayhints.nvim",
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
    opts = {
      autocmd = {
        enabled = true,
      },
      ignore = {
        clients = {
          "null-ls",
        }
      }
    },
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = true,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
      })
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    dependencies = "mattn/webapi-vim",
    config = function()
      vim.cmd([[
      let g:rustfmt_autosave = 1
      setlocal mps+=<:>
      ]])
    end,
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
    enabled = false,
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
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.golangci_lint,
          -- null_ls.builtins.diagnostics.cpplint.with({
          --   filetypes = {
          --     "cpp"
          --   },
          --   args = {
          --     "--filter=-legal/copyright",
          --     "$FILENAME"
          --   },
          -- }),
        },
        on_attach = function(client, bufnr)
          require("config.plugins.lspconfig_utils").set_keymappings(client, bufnr)
        end,
        on_init = function(client, _)
          client.offset_encoding = 'utf-16'
        end
      })
    end,
    -- enabled = false
  },

  {
    "p00f/clangd_extensions.nvim",
    ft = {
      "c",
      "cpp",
    },
    keys = {
      { "<leader>ht", "<Cmd>ClangdTypeHierarchy<CR>" }
    },
    config = function()
      require("config.plugins.clangd_extensions")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    enabled = false,
  },

  {
    'Wansmer/symbol-usage.nvim',
    event = 'LspAttach', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require('symbol-usage').setup({
        vt_position = 'end_of_line',
        -- vt_position = 'textwidth',
      })
    end
  },

  {
    "ray-x/go.nvim",
    ft = {
      "go",
      "gomod"
    },
    config = function()
      require("go").setup({
        lsp_cfg = true,
        lsp_inlay_hints = {
          enable = true,
          only_current_line = true,
          only_current_line_autocmd = nil
        }
      })
      local config = require("go.lsp").config()
      local utils = require("config.plugins.lspconfig_utils")
      config.settings.gopls.staticcheck = false
      require('lspconfig').gopls.setup({
        settings = config.settings,
        on_attach = utils.on_attach_default,
      })
    end
  },
}
