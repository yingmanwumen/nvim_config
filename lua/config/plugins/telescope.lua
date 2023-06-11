local telescope = require("telescope")

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    prompt_prefix = "❯ ",
    selection_caret = "➤ ",
    preview = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      center = {
        anchor = "N",
      }
    }
  },
  pickers = {
    command_history           = { theme = "dropdown" },
    command                   = { theme = "dropdown" },
    spell_suggest             = { theme = "dropdown" },
    builtin                   = { theme = "dropdown", previewer = false },
    current_buffer_fuzzy_find = { theme = "dropdown" },
    buffers                   = { theme = "dropdown" },
    find_files                = { theme = "dropdown" },
    oldfiles                  = { theme = "dropdown" },
    marks                     = { theme = "dropdown" },
    live_grep                 = { theme = "dropdown" },
    lsp_references            = { theme = "cursor", preview = true },
    lsp_definitions           = { theme = "cursor", preview = true },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    },
  }
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("projects")
