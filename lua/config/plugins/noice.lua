require("noice").setup({
  presets = {
    long_message_to_split = true,
    command_palette = true,
    bottom_search = true,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        find = "written",
      },
      opts = {
        skip = true
      },
    },
  },
})
