local servers = {
  lua_ls = {
    settings = {
      Lua = {
        codeLens = {
          enable = true,
        },
        hint = {
          enable = true,
          setType = true,
        },
      },
    },
  },

  rust_analyzer = {},

  clangd = {
    on_attach = function(_, _)
      require("clangd_extensions").setup({
        autoSetHints = false,
      })
    end
  },

  pyright = {},

  vimls = {},

  yamlls = {},

  jsonls = {},

  cmake = {},
}

local server_list = {}
for server, _ in pairs(servers) do
  server_list[#server_list + 1] = server
end

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed       = server_list,
})

local set_autoformat = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("AutoFormat", { clear = false }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
end

local set_keymappings = function(bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', { buffer = bufnr })
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', { buffer = bufnr })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, { buffer = bufnr })
end

local set_codelens = function(client, bufnr)
  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("CodeLens", { clear = false }),
      buffer = bufnr,
      callback = function()
        vim.lsp.codelens.refresh()
      end
    })
  end
end

local set_inlayhints = function(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr)
end

local on_attach_default = function(client, bufnr)
  set_keymappings(bufnr)
  set_codelens(client, bufnr)
  set_autoformat(client, bufnr)
  set_inlayhints(client, bufnr)
end

for server, options in pairs(servers) do
  require("lspconfig")[server].setup({
    on_attach = function(client, bufnr)
      on_attach_default(client, bufnr)
      options.on_attach(client, bufnr)
    end,
    settings = options.settings,
  })
end
