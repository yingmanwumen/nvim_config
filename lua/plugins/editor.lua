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

	-- tags support
	{
		"liuchengxu/vista.vim",
		cmd = "Vista",
		keys = {
			{ "<M-f>v", "<Cmd>Vista finder coc<CR>" },
			{ "<M-v>", "<Cmd>Vista coc<CR>" },
		},
		dependencies = {
			"junegunn/fzf",  -- fzf
		},
		config = function ()
			vim.cmd[[
				let g:vista_fold_toggle_icons = ["", ""]
				let g:vista_cursor_delay = 0
				let g:vista_echo_cursor_strategy = "floating_win"
				let g:vista_update_on_text_changed = 1
				let g:vista_close_on_jump = 1
				]]
		end
	},
}
