require("bufferline").setup({
  options = {
    diagnostics = "coc",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "coc-explorer",
        text = "Coc Explorer",
	highlight = "Directory",
        text_align = "left",
      }
    },
    separator_style = "slant",
    numbers = "ordinal",
    indicator = {
      style = "underline"
    }
  }
})
