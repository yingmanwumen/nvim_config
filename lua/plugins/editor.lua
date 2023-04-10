return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<M-f>b", "<Cmd>Telescope buffers<CR>" },
      { "<M-f>:", "<Cmd>Telescope command_history<CR>" },
      { "<M-f>f", "<Cmd>Telescope find_files<CR>" },
      { "<M-f>l", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<M-f>m", "<Cmd>Telescope marks<CR>" },
      { "<M-f>r", "<Cmd>Telescope live_grep<CR>" },
    },
  },

  -- jump to definition
  {
    "phaazon/hop.nvim",
    keys = {
      { "<leader><leader>j", "<Cmd>HopLineAC<CR>" },
      { "<leader><leader>k", "<Cmd>HopLineBC<CR>" },
      { "<leader><leader>w", "<Cmd>HopWord<CR>" },
      { "<leader><leader>s", "<Cmd>HopChar1<CR>" },
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

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<M-=>", "<Cmd>ToggleTerm size=25<CR>" },
    },
    init = function ()
      require("toggleterm").setup()
    	vim.cmd [[
      	tnoremap <M--> <C-\><C-n>:q<CR>
        tnoremap <M-q> <C-\><C-n>
    	]]
    end
  }
}
