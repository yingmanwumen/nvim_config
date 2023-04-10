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
})
