local utils = require("config.plugins.lspconfig_utils")
local format_buffer = utils.format_buffer

return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic"
      }
    }
  },
  autoformat = function(bufnr)
    local group = vim.api.nvim_create_augroup("AutoFormat", { clear = false })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group    = group,
      buffer   = bufnr,
      callback = function()
        format_buffer(bufnr, function(file)
          vim.fn.execute("! black " .. file)
        end)
      end
    })
  end
}
