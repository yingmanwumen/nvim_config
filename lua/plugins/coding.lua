return {
  -- ultisnips
  {
    "SirVer/ultisnips",
    event = "InsertEnter",
    config = function()
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips", }
    end
  },

  -- snips
  {
    "honza/vim-snippets",
    event = "InsertEnter",
  },

  -- codeium
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    keys = {
      { "<M-c>", "<Cmd>call codeium#Clear()<CR>", mode = "i" },
      { "<C-CR>", "codeium#Accept()", mode = "i", nowait = true, expr = true, silent = true, script =true}
    },
  },

  -- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- go
  {
    "fatih/vim-go",
    ft = "go",
  },

  -- comment
  {
    "echasnovski/mini.comment",
    event = {
      "BufReadPost",
      "BufNewFile"
    },
    config = function()
      require("config.plugins.comment")
    end,
  },

  -- surround
  {
    "kylechui/nvim-surround",
    event = {
      "BufReadPost",
      "BufNewFile"
    },
    config = function ()
      require("nvim-surround").setup()
    end
  },

  -- align
  {
    "junegunn/vim-easy-align",
    keys = {
      { "<leader>a", "<Plug>(EasyAlign)", mode = { 'n', 'x' } },
    }
  },
}

