require("lualine").setup({
  options = {
    globalstatus = true,
    disabled_filetypes = {
      statusline = {
        "lazy",
        "startify",
      },
    },
    extensions = { "lazy" }
  },
	sections = {
		lualine_c = {
			"filename",
			-- Display CocStatus in lualine
			"g:coc_status"
		}
	}
})
