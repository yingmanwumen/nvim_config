return {
  -- startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function ()
      vim.g.startuptime_tries = 100
    end
  },

  -- library for other plugins
  { "nvim-lua/plenary.nvim" },

  -- repeat
  { "tpope/vim-repeat", event = "VeryLazy" },

	-- fzf
	{
		"junegunn/fzf",
		cmd = "FZF",
	},
}
