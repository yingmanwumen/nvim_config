require("bufferline").setup({
  options = {
    always_show_bufferline = false,
    numbers = "ordinal",
    indicator = {
      style = "underline"
    },
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        text_align = "left",
      }
    },
  },
})
