require("bufferline").setup({
  options = {
    diagnostics = "coc",
    always_show_bufferline = false,
    offsets = {
      {
        filetype   = "coc-explorer",
        text       = "Coc Explorer",
        highlight  = "Directory",
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
