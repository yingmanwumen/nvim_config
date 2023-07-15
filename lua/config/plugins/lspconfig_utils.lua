local set_autoformat = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group    = vim.api.nvim_create_augroup("AutoFormat", { clear = false }),
      buffer   = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
end

local set_keymappings = function(client, bufnr)
  vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', { buffer = bufnr })
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', { buffer = bufnr })
  vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', { buffer = bufnr })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
  vim.keymap.set('n', '<leader>hi', vim.lsp.buf.incoming_calls, { buffer = bufnr })
  vim.keymap.set('n', '<leader>ho', vim.lsp.buf.outgoing_calls, { buffer = bufnr })
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = bufnr })
  vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, { buffer = bufnr })
end

local set_codelens = function(client, bufnr)
  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter", "InsertLeave" }, {
      group    = vim.api.nvim_create_augroup("CodeLens", { clear = false }),
      buffer   = bufnr,
      callback = vim.lsp.codelens.refresh
    })
  end
end

local set_inlayhints = function(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr)
end

local on_attach_default = function(client, bufnr, options)
  set_keymappings(client, bufnr)
  set_codelens(client, bufnr)
  if options ~= nil and type(options.autoformat) == "function" then
    options.autoformat(bufnr)
  else
    set_autoformat(client, bufnr)
  end
  set_inlayhints(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navbuddy").attach(client, bufnr)
  end
end

local modify_buffer = function(bufnr, callback)
  local cursor   = vim.api.nvim_win_get_cursor(0)
  local lines    = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local tmp_file = os.tmpname()
  local f        = io.open(tmp_file, "w")
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
  cursor[1] = math.min(cursor[1], #lines)
  vim.api.nvim_win_set_cursor(0, cursor)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  os.remove(tmp_file)
end

return {
  set_autoformat    = set_autoformat,
  set_keymappings   = set_keymappings,
  set_codelens      = set_codelens,
  set_inlayhints    = set_inlayhints,
  on_attach_default = on_attach_default,
  format_buffer     = modify_buffer,
}
