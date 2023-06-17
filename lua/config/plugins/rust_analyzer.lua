return {
  manual_setup = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        on_attach = function(client, bufnr)
          On_attach_default(client, bufnr)
        end,
        standalone = true,
      },
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    })
  end
}
