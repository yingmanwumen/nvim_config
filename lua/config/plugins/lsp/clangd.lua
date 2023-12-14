local utils = require("config.plugins.lspconfig_utils")
local format_buffer = utils.format_buffer

local format_c = function(bufnr, style)
  format_buffer(bufnr, function(file)
    vim.fn.execute("! indent " .. style .. " " .. file .. " -o " .. file)
  end)
end

local format_cpp = function(bufnr, style, indent)
  style = "-style='{BasedOnStyle: " .. style .. ", IndentWidth: " .. indent .. "}'"
  format_buffer(bufnr, function(file)
    vim.fn.execute("! clang-format -i " .. style .. " " .. file)
  end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
capabilities.documentFormattingProvider = false

return {
  -- autoformat = function(bufnr)
  --   local group = vim.api.nvim_create_augroup("AutoFormat", { clear = false })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group    = group,
  --     buffer   = bufnr,
  --     callback = function()
  --       format_cpp(bufnr, "google", 2)
  --       -- if vim.bo.filetype == "c" then
  --       -- format_c(bufnr, "--linux-style")
  --       -- else
  --       --   format_cpp(bufnr, "llvm", 4)
  --       -- end
  --     end
  --   })
  -- end,
  capabilities = capabilities,
  settings = {
    clangd = {
      arguments = {
        "--all-scopes-completion",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--fallback-style=google",
        "--function-arg-placeholders",
      }
    }
  }
}
