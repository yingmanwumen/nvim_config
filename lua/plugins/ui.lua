return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
    },
  },

  { "navarasu/onedark.nvim" },

  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<M-j>", "<Cmd>BufferLineCyclePrev<CR>" },
      { "<M-k>", "<Cmd>BufferLineCycleNext<CR>" },
      { "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>" },
      { "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>" },
      { "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>" },
      { "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>" },
      { "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>" },
      { "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>" },
      { "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>" },
      { "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>" },
      { "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>" },
    },
    config = function()
      require("config.plugins.bufferline")
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.lualine")
    end
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      vim.notify.setup({
        render = "minimal",
        top_down = false,
      })
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("config.plugins.noice")
    end,
  },

  {
    "echasnovski/mini.indentscope",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      require("config.plugins.indentscope")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      require("indent_blankline").setup({
        filetype_exclude = {
          "help",
          "dashboard",
          "Trouble",
          "lazy",
          "NvimTree"
        },
        show_trailing_blankline_indent = false,
        show_current_context = false,
      })
    end
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("config.plugins.dashboard")
    end
  },

  {
    "junegunn/rainbow_parentheses.vim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      vim.cmd [[
        let g:rainbow#pairs = [ ['(', ')'], ['[', ']'], ['{', '}'], ['<', '>'] ]
        RainbowParentheses
      ]]
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = {
      "BufReadPost",
      "BufNewFile"
    },
    config = true
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = 'qf'
  },

  {
    "stevearc/dressing.nvim",
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
