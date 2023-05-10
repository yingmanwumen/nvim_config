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
        -- height = 0.8,
      }
    }
  },
  extensions = {
    coc = {
      prefer_locations = true,
      theme = "dropdown",
    },
    rooter = {
      patterns = {
        ".git",
        "package.json",
      }
    }
  },
  pickers = {
    command_history = {
      theme = "dropdown",
    },
    commands = {
      theme = "dropdown",
    },
    spell_suggest = {
      theme = "cursor",
    },
    builtin = {
      theme = "dropdown",
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    find_files = {
      theme = "dropdown",
    },
    oldfiles = {
      theme = "dropdown",
    },
    marks = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
})

telescope.load_extension("coc")
telescope.load_extension("fzf")
telescope.load_extension("rooter")
