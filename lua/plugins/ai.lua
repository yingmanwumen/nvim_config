return {
  {
    "tzachar/cmp-tabnine",
    build = './install.sh',
    config = true
  },

  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    keys = {
      { "<M-c>",  "<Cmd>call codeium#Clear()<CR>", mode = "i" },
      { "<C-CR>", "codeium#Accept()",              mode = "i", nowait = true, expr = true, silent = true, script = true },
    },
    config = function()
      vim.cmd [[
        let g:codeium_filetypes = { 'markdown': v:false }
      ]]
    end
  },
}
