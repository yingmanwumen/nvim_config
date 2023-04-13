require("noice").setup({
  presets = {
    long_message_to_split = true,
    command_palette = true,
    bottom_search = true
  },
  routes = {
    -- disable `written` message
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#hide-written-messages
    {
      filter = {
        event = "msg_show",
        find = "written",
      },
      opts = {
        skip = true
      }
    }
  },
})
