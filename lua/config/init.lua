---@diagnostic disable-next-line: different-requires
require("config.lazy")

if vim.g.neovide then
  require("config.neovide")
end
