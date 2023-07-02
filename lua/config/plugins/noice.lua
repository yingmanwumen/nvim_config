require("noice").setup({
  presets = {
    long_message_to_split = true,
    command_palette       = true,
    bottom_search         = true,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        find  = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "lsp",
        kind = "progress",
        cond = function(message)
          local client = vim.tbl_get(message.opts, "progress", "client")
          return client == "null-ls" -- skip lua-ls progress
        end,
      },
      opts = { skip = true },
    }
  },
  lsp = {
    signature = { enabled = false }
  }
})
