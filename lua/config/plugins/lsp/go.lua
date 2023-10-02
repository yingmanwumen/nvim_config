require("go").setup({
  lsp_cfg = true,
  lsp_inlay_hints = {
    enable = true,
    only_current_line = true,
    only_current_line_autocmd = nil
  }
})

local config = require("go.lsp").config()
local utils = require("config.plugins.lspconfig_utils")

config.settings.gopls.staticcheck = false

return {
  on_attach = utils.on_attach_default,
  settings = config.settings,
  capabilities = config.capabilities,
}
