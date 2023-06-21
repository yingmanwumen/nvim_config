local utils = require("config.plugins.lspconfig_utils")
local modify_buffer = utils.modify_buffer

return {
  on_attach = function(_, _)
    -- require("clangd_extensions").setup({
    --   autoSetHints = false,
    -- })
  end,
  settings = {},
  autoformat = function(bufnr)
    local group = vim.api.nvim_create_augroup("AutoFormat", { clear = false })
    local format_c = function()
      local style = "--linux-style"
      modify_buffer(bufnr, function(file)
        vim.fn.execute("! indent " .. style .. " " .. file .. " -o " .. file)
      end)
    end
    local format_cpp = function()
      local style = "llvm"
      local indent_width = 4
      style = "-style='{BasedOnStyle: " .. style .. ", IndentWidth: " .. indent_width .. "}'"
      modify_buffer(bufnr, function(file)
        vim.fn.execute("! clang-format -i " .. style .. " " .. file)
      end)
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      callback = function()
        if vim.bo.filetype == "c" then
          format_c()
        else
          format_cpp()
        end
      end
    })
  end
}
