local telescope = require("telescope")
local actions   = require("telescope.actions")

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    prompt_prefix         = "❯ ",
    selection_caret       = "➤ ",
    sorting_strategy      = "ascending",
    mappings              = {
      i = {
        ["<ESC>"] = actions.close
      },
    },
  },
  pickers = {
    --   buffers                   = { theme = "ivy", preview = true },
    builtin = { theme = "ivy", previewer = false },
    --   commands                  = { theme = "ivy" },
    --   command_history           = { theme = "ivy" },
    --   current_buffer_fuzzy_find = { theme = "ivy", preview = true },
    --   find_files                = { theme = "ivy", preview = true },
    --   live_grep                 = { theme = "ivy", preview = true },
    --   lsp_definitions           = { theme = "cursor", preview = true },
    --   lsp_references            = { theme = "cursor", preview = true },
    --   marks                     = { theme = "ivy" },
    --   oldfiles                  = { theme = "ivy", preview = true },
    --   spell_suggest             = { theme = "ivy" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    },
    ["fzf"] = {
      fuzzy = true,
    },
  }
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("projects")
require("telescope").load_extension("fzf")
