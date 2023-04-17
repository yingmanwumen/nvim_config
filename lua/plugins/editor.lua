return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-k>",  "<Cmd>Telescope<CR>"                           },
      { "<M-f>b", "<Cmd>Telescope buffers<CR>"                   },
      { "<M-f>:", "<Cmd>Telescope command_history<CR>"           },
      { "<M-f>f", "<Cmd>Telescope find_files<CR>"                },
      { "<M-f>h", "<Cmd>Telescope oldfiles<CR>"                  },
      { "<M-f>l", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<M-f>m", "<Cmd>Telescope marks<CR>"                     },
      { "<M-f>r", "<Cmd>Telescope live_grep<CR>"                 },
      { "<M-f>s", "<Cmd>Telescope spell_suggest<CR>"             },
    },
    config = function ()
      require("config.plugins.telescope")
    end
  },

  -- telescope cooprates with coc.nvim
  -- would be set up by telescope
  {
    "fannheyward/telescope-coc.nvim",
    keys = {
      { "<M-f>c", "<Cmd>Telescope coc<CR>" },
    },
  },

  -- fzf support for telescope
  -- would be set up by telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  -- Makes sure to always start telescope (and only telescope) from the project/root directory.
  -- would be set up by telescope
  {
    "desdic/telescope-rooter.nvim",
  },

  -- jump to definition
  {
    "phaazon/hop.nvim",
    keys = {
      { "<leader><leader>j", "<Cmd>HopLineAC<CR>" },
      { "<leader><leader>k", "<Cmd>HopLineBC<CR>" },
      { "<leader><leader>w", "<Cmd>HopWord<CR>"   },
      { "<leader><leader>s", "<Cmd>HopChar1<CR>"  },
    },
    config = function()
      require("hop").setup()
    end
  },

  -- git sign support
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.plugins.gitsigns")
    end,
  },

  -- git ignore support
  {
    "wintermute-cell/gitignore.nvim",
    cmd = "Gitignore",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    }
  },

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<M-=>", "<Cmd>ToggleTerm size=25<CR>i<C-w>" },
    },
    config = function ()
      require("toggleterm").setup()
      vim.cmd [[
        tnoremap <silent> <M--> <C-\><C-n>:q<CR>
        tnoremap <silent> <M-q> <C-\><C-n>
      ]]
    end
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },

}
