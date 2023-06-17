return {
  on_attach = function(_, _)
    require("clangd_extensions").setup({
      autoSetHints = false,
    })
  end,
  settings = {},
  autoformat = function(bufnr)
    local group = vim.api.nvim_create_augroup("AutoFormat", { clear = false })
    local format_c = function(bufname)
      local style = "--linux-style"
      vim.fn.execute("! indent " .. style .. " " .. bufname .. " -o " .. bufname)
    end
    local format_cpp = function(bufname)
      local style = "llvm"
      local indent_width = 4
      style = "-style='{BasedOnStyle: " .. style .. ", IndentWidth: " .. indent_width .. "}'"
      vim.fn.execute("! clang-format -i " .. style .. " " .. bufname)
    end
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = group,
      buffer = bufnr,
      callback = function()
        local bufname = vim.fn.bufname(bufnr)
        if vim.bo.filetype == "c" then
          format_c(bufname)
        else
          format_cpp(bufname)
        end
      end
    })
  end
}
