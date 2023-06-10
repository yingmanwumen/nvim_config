local servers = {
  lua_ls = {},
  rust_analyzer = {},
  clangd = {},
  pyright = {},
}

local server_list = {}
for server, _ in pairs(servers) do
  server_list[#server_list + 1] = server
end

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = server_list,
})

for server, options in pairs(servers) do
  require("lspconfig")[server].setup(options)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set('n', 'K',          vim.lsp.buf.hover,       { buffer = args.buf })
    vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', { buffer = args.buf })
    vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>',  { buffer = args.buf })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
  end
})
