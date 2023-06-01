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
  rainbow = {
    enable = true,
    disable = {
      "tex",
      "latex",
    },
  },
})
