return {
  {
    "mhinz/vim-startify",
    event = "VimEnter",
    init = function()
      require("config.plugins.vim-startify")
    end,
  }
}
