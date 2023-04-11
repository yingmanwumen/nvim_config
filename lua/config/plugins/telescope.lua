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
		rooter = {
			patterns = {
				".git"
			}
		}
	},
})

telescope.load_extension("coc")
telescope.load_extension("fzf")
telescope.load_extension("rooter")
