require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    disable = {
      "latex"
    },
    additional_vim_regex_highlighting = {
      "latex"
    }
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
  },
  rainbow = {
    enable = true,
    disable = {
      "tex",
      "latex",
    },
  },
})

