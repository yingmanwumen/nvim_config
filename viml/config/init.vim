let s:cur_path = "~/.config/nvim/viml/config/"

exec "source " . s:cur_path . "/theme.vim"
exec "source " . s:cur_path . "/options.vim"
exec "source " . s:cur_path . "/autocmds.vim"

lua << EOF

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.cmd[[
      exec "source ~/.config/nvim/viml/config/keymaps.vim"
    ]]
  end,
})

EOF
