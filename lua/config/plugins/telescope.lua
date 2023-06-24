local telescope = require("telescope")
local actions   = require("telescope.actions")

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    prompt_prefix         = "❯ ",
    selection_caret       = "➤ ",
    preview               = false,
    sorting_strategy      = "ascending",
    layout_strategy       = "center",
    layout_config         = {
      center = {
        anchor = "N",
      }
    },
    mappings              = {
      i = {
        ["<ESC>"] = actions.close
      },
    },
  },
  pickers = {
    buffers                   = { theme = "dropdown", preview = true },
    builtin                   = { theme = "dropdown", previewer = false },
    command                   = { theme = "dropdown" },
    command_history           = { theme = "dropdown" },
    current_buffer_fuzzy_find = { theme = "dropdown" },
    find_files                = { theme = "dropdown", preview = true },
    live_grep                 = { theme = "dropdown", preview = true },
    lsp_definitions           = { theme = "cursor", preview = true },
    lsp_references            = { theme = "cursor", preview = true },
    marks                     = { theme = "dropdown" },
    oldfiles                  = { theme = "dropdown", preview = true },
    spell_suggest             = { theme = "dropdown" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    },
  }
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("projects")
