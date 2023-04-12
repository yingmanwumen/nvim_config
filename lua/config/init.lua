require("config.lazy")

vim.cmd[[source ~/.config/nvim/viml/config/init.vim]]

if vim.g.neovide then
	require("config.neovide")
end
