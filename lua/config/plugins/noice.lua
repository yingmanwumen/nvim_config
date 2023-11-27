require("noice").setup({
  presets = {
    long_message_to_split = true,
    command_palette       = true,
    bottom_search         = true,
    lsp_doc_border        = true,
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
    },
    {
      filter = {
        find = "-32603: Invalid offset",
      },
      opts = { skip = true },
    },
    {
      filter = {
        find = "code_name = InternalError",
      },
      opts = { skip = true },

    }
  },
  lsp = {
    signature = { enabled = false },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        win_options = { concealcursor = "n", conceallevel = 0 },
      }
    },
    hover = {
      silent = true,
    }
  }
})
