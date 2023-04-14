local telescope = require("telescope")

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    prompt_prefix = "❯ ",
    selection_caret = "➤ ",
    theme = "dropdown",
    previewer = true,
    sorting_strategy = "ascending",
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
  },
})

telescope.load_extension("coc")
telescope.load_extension("fzf")
telescope.load_extension("rooter")
