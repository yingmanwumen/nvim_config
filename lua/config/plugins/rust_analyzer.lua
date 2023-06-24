local utils = require("config.plugins.lspconfig_utils")
local on_attach_default = utils.on_attach_default

return {
  manual_setup = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        on_attach = on_attach_default,
        standalone = true,
      },
      tools = {
        inlay_hints = { auto = false },
      },
    })
  end
}
