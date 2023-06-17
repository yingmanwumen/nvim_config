return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "tzachar/cmp-tabnine",
    },
    config = function()
      require("config.plugins.nvim-cmp")
    end
  },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lua" },
  { "petertriho/cmp-git" },
  { "saadparwaiz1/cmp_luasnip" },

  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    build = "make install_jsregexp",
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr   = true,
        silent = true,
        mode   = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnips/" })
    end
  },

  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = true
  },

  {
    "echasnovski/mini.comment",
    keys = {
      { "<C-/>", mode = { 'n', 'x', 'i' } },
    },
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment      = "<C-/>",
          comment_line = "<C-/>",
          textobject   = "<C-/>",
        }
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
    },
    keys = {
      { "<M-e>", "<Cmd>NvimTreeToggle<CR>" },
    },
    config = function()
      require("config.plugins.nvim-tree")
    end,
    init = function()
      vim.cmd [[
        " Start NvimTree when Vim starts with a directory argument.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NvimTreeOpen' argv()[0] | endif
      ]]
    end
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      { "<leader>a", "<Plug>(EasyAlign)", mode = { 'n', 'x' } },
    },
  },

  {
    "kylechui/nvim-surround",
    keys = {
      "cs",
      "ds",
      "ys",
    },
    config = true,
  },

  {
    "yingmanwumen/hop.nvim",
    keys = {
      { "<leader><leader>j", "<Cmd>HopLineAC<CR>" },
      { "<leader><leader>k", "<Cmd>HopLineBC<CR>" },
      { "<leader><leader>w", "<Cmd>HopWord<CR>" },
      { "<leader><leader>s", "<Cmd>HopChar1<CR>" },
      { "<leader><leader>l", "<Cmd>HopWorkCurrentLineAC<CR>" },
      { "<leader><leader>h", "<Cmd>HopWorkCurrentLineBC<CR>" },
    },
    config = true,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require("config.plugins.gitsigns")
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    keys = {
      { "<C-k>",  "<Cmd>Telescope<CR>" },
      { "<M-f>b", "<Cmd>Telescope buffers<CR>" },
      { "<M-f>:", "<Cmd>Telescope command_history<CR>" },
      { "<M-f>f", "<Cmd>Telescope find_files<CR>" },
      { "<M-f>h", "<Cmd>Telescope oldfiles<CR>" },
      { "<M-f>l", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<M-f>m", "<Cmd>Telescope marks<CR>" },
      { "<M-f>r", "<Cmd>Telescope live_grep<CR>" },
      { "<M-f>p", "<Cmd>Telescope projects<CR>" },
    },
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      require("config.plugins.telescope")
    end,
  },

  { "nvim-telescope/telescope-ui-select.nvim" },

  {
    "wintermute-cell/gitignore.nvim",
    cmd = "Gitignore",
    dependencies = "nvim-telescope/telescope.nvim",
  },

  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<M-=>", "<Cmd>ToggleTerm size=25<CR>i<C-w>" },
    },
    config = true,
  },

  {
    "RutaTang/spectacle.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>sl", "<Cmd>lua require('spectacle').SpectacleTelescope()<CR>" },
      { "<leader>ss", "<Cmd>lua require('spectacle').SpectacleSaveAs()<CR>" },
    },
    config = true,
  },

  {
    "ahmedkhalf/project.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require("project_nvim").setup()
    end,
  },

  {
    "mg979/docgen.vim",
    cmd = "DocGen",
  },

  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("leetbuddy").setup({
        language = "py",
      })
    end,
    cmd = "LBQuestions",
  },

  {
    "lervag/vimtex",
    ft = { "tex", "latex", "plaintex" },
    config = function()
      require("config.plugins.vimtex")
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<M-v>", "<Cmd>SymbolsOutline<CR>" },
    },
    config = function()
      require("config.plugins.symbols-outline")
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "CursorHold",
    init = function()
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "*" },
        callback = function(_)
          vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
        end
      })
    end
  },

  {
    "romainl/vim-cool",
    keys = {
      { "n" },
      { "N" },
      { "#" },
      { "*" },
    }
  },

}
