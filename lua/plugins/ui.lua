return {
  -- dashboard: dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.plugins.dashboard")
    end,
  },

  -- web icons
  { "nvim-tree/nvim-web-devicons" },

  -- ui components
  { "MunifTanjim/nui.nvim" },

  -- indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {
      "BufReadPost",
    },
    config = function()
      require("config.plugins.indent-blankline")
    end,
  },

  -- indent scope
  {
    "echasnovski/mini.indentscope",
    event = {
      "BufReadPost",
    },
    config = function()
      require("config.plugins.indentscope")
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<M-j>", "<Cmd>BufferLineCyclePrev<CR>"    },
      { "<M-k>", "<Cmd>BufferLineCycleNext<CR>"    },
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

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.lualine")
      -- vim.opt.laststatus = 2
    end
  },

  -- todo comments
  -- TODO:
  -- PERF:
  -- HACK: 
  -- NOTE: 
  -- FIX: 
  -- WARNING:
  {
    "folke/todo-comments.nvim",
    cmd = "TodoTelescope",
    event = {
      "BufReadPost",
      "BufNewFile"
    },
    config = true
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("config.plugins.notify")
    end,
  },

  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function ()
      require("config.plugins.noice")
    end,
    cond = function()
      return not vim.g.neovide
    end,
  },

  -- animate
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function()
      require("mini.animate").setup({
        cursor = {
          enable = false
        }
      })
    end,
    enabled = false
  },
}
