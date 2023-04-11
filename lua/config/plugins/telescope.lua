local telescope = require("telescope")

telescope.setup({
	defaults = {
		dynamic_preview_title = true,
	},
	extensions = {
		coc = {
			prefer_locations = true,
			theme = "dropdown"
		},
	},
})

telescope.load_extension("coc")
telescope.load_extension("fzf")
