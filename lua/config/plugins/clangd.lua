local modify_buffer = function(bufnr, callback)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local tmp_file = os.tmpname()
  local f = io.open(tmp_file, "w")
  if f == nil then
    vim.api.nvim_err_writeln("Failed to create temporary file")
    return
  end
  f:write(table.concat(lines, "\n"))
  f:close()
  callback(tmp_file)
  f = io.open(tmp_file, "r")
  if f == nil then
    vim.api.nvim_err_writeln("Failed to read temporary file")
    return
  end
  local text = f:read("*a")
  lines = vim.split(text, "\n")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, cursor)
  os.remove(tmp_file)
end

return {
  on_attach = function(_, _)
    require("clangd_extensions").setup({
      autoSetHints = false,
    })
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
    vim.api.nvim_create_autocmd("BufWritePost", {
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
