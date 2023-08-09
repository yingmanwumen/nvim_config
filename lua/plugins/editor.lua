return {
  { "honza/vim-snippets" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-omni" },
  { "hrsh7th/cmp-path" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "petertriho/cmp-git" },
  { "saadparwaiz1/cmp_luasnip" },

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

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "honza/vim-snippets"
    },
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
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end
  },

  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = true
  },

  {
    "tpope/vim-commentary",
    keys = {
      { "<C-/>", ":Commentary<CR>",     mode = { 'n', 'x' }, silent = true },
      { "<C-/>", "<Cmd>Commentary<CR>", mode = { 'i' } },
    },
    config = function()
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
    },
    keys = {
      { "<M-e>", "<Cmd>NvimTreeToggle<CR>", mode = { "n", "x", "i" } },
    },
    config = function()
      require("config.plugins.nvim-tree")
    end,
    init = function()
      -- Start NvimTree when Vim starts with a directory argument.
      vim.cmd [[
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
      { "<leader><leader>j", "<Cmd>HopLineAC<CR>",            mode = { "n", "x" }, },
      { "<leader><leader>k", "<Cmd>HopLineBC<CR>",            mode = { "n", "x" }, },
      { "<leader><leader>w", "<Cmd>HopWord<CR>",              mode = { "n", "x" }, },
      { "<leader><leader>s", "<Cmd>HopChar1<CR>",             mode = { "n", "x" }, },
      { "<leader><leader>l", "<Cmd>HopWordCurrentLineAC<CR>", mode = { "n", "x" }, },
      { "<leader><leader>h", "<Cmd>HopWordCurrentLineBC<CR>", mode = { "n", "x" }, },
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
    keys = {
      { "<C-k>",   "<Cmd>Telescope<CR>" },
      { "<M-f>b",  "<Cmd>Telescope buffers<CR>" },
      { "<M-f>.",  "<Cmd>Telescope command_history<CR>" },
      { "<M-f>f",  "<Cmd>Telescope find_files<CR>" },
      { "<M-f>h",  "<Cmd>Telescope oldfiles<CR>" },
      { "<M-f>l",  "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<M-f>m",  "<Cmd>Telescope marks<CR>" },
      { "<M-f>r",  "<Cmd>Telescope live_grep<CR>" },
      { "<M-f>p",  "<Cmd>Telescope projects<CR>" },
      -- Notice! map ctrl+shift+p to \x1b[80;5u in terminal
      { "<C-S-P>", "<Cmd>Telescope commands<CR>",                 mode = { "i", "n", "x" }, },
      { "<M-P>",   "<Cmd>Telescope commands<CR>",                 mode = { "i", "n", "x" }, },
    },
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      require("config.plugins.telescope")
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

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
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      -- vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash"
      vim.g.doge_doc_standard_c = "kernel_doc"
    end
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
    dependencies = "hrsh7th/cmp-omni",
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
    event = {
      "BufReadPost",
      "BufNewFile"
    },
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
      { "/" },
      { "?" },
    }
  },

  {
    "tpope/vim-speeddating",
    keys = {
      { "<C-A>" },
      { "<C-X>" },
    },
  },

  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 100
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    cmd = "ColorizerToggle",
    config = true
  },

  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    config = function()
      require("glow").setup({})
      vim.cmd [[
        nnoremap <leader>g <Cmd>Glow<CR>
      ]]
    end
  },

  {
    "m4xshen/hardtime.nvim",
    event   = "VeryLazy",
    config  = true,
    enabled = false,
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  { "mattn/webapi-vim" },

  {
    "alpertuna/vim-header",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    cmd = {
      "AddHeader",
      "AddMinHeader",
      "AddMITLicense",
      "AddApacheLicense",
      "AddGNULicense",
      "AddAGPLicense",
      "AddLGPLLicense",
      "AddMPLLicense",
      "AddWTFPLLicense",
      "AddZlibLicense",
    },
    config = function()
      vim.g.header_field_author = 'ymwm'
      vim.g.header_field_author_email = 'yingmanwumen@foxmail.com'
      vim.g.header_auto_add_header = 1
    end
  },

  {
    "folke/trouble.nvim",
    keys = {
      { "<M-d>", "<Cmd>TroubleToggle<CR>", mode = { "n", "x", "i" }, },
    },
    opts = {
      action_keys = {
        jump_close = {},
        toggle_fold = { "za", "zA", "o" },
        sings = {
          error = require("config.icons").Dianostics.Error,
          warning = require("config.icons").Dianostics.Warning,
          infomation = require("config.icons").Dianostics.Information,
          other = require("config.icons").Dianostics.Hint,
        }
      }
    },
  },

  {
    "tomiis4/hypersonic.nvim",
    event = "CmdlineEnter",
    cmd = "Hypersonic",
    config = function()
      require("hypersonic").setup({})
    end
  },

  {
    "lewis6991/hover.nvim",
    keys = {
      { "K",  function() require("hover").hover() end },
      { "gk", function() require("hover").hover_select() end },
    },
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.gh")
          require("hover.providers.gh_user")
          require("hover.providers.jira")
          require("hover.providers.man")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = "rounded",
        },
      })
    end,
  },
}
