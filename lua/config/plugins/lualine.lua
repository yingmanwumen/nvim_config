local function get_mode()
	return require("noice").api.statusline.mode.get() or ""
end

require("lualine").setup({
  options = {
    globalstatus = true,
    disabled_filetypes = {
      statusline = {
        "lazy",
        "dashboard",
      },
    },
    extensions = { "lazy" }
  },
	sections = {
		lualine_c = {
			"filename",
			get_mode,
			-- Display CocStatus in lualine
			"g:coc_status"
		}
	}
})
