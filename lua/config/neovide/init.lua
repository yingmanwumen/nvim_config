-- Get env $ZSHRC_SOURCED
if not string.find(os.getenv("PATH") or "", "cargo") then
  local home_path = os.getenv("HOME") or os.exit(-1)
  local cargo_bin_path = home_path .. "/.cargo/bin"
  local local_bin_path = home_path .. "/.local/bin"
  local go_bin_path = home_path .. "/.go/bin"
  local sep = ":"
  vim.env.PATH = vim.env.PATH .. sep .. local_bin_path .. sep .. cargo_bin_path .. sep .. go_bin_path
end
require('config.neovide.keymap')
require('config.neovide.options')
require('config.neovide.ui')
