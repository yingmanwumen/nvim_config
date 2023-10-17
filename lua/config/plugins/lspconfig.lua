-- vim.lsp.set_log_level(vim.log.levels.OFF)

local utils = require("config.plugins.lspconfig_utils")
local on_attach_default = utils.on_attach_default

local lsps = {
  sourcery      = {
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end
  },

  bashls        = {
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = true
    end
  },

  clangd        = {
    on_attach = function(client, bufnr)
      local clang_config = require("config.plugins.lsp.clangd")
      utils.on_attach_default(client, bufnr, clang_config)
    end,
    capabilities = require("config.plugins.lsp.clangd").capabilities,
  },

  lua_ls        = require("config.plugins.lsp.lua_ls"),
  pyright       = require("config.plugins.lsp.pyright"),

  -- rust_analyzer = require("config.plugins.lsp.rust_analyzer"),

  -- gopls         = require("config.plugins.lsp.go"),

  gopls         = {},
  rust_analyzer = {},
  neocmake      = {},
  jsonls        = {},
  vimls         = {},
  yamlls        = {},
}

local server_list = {}
for server, _ in pairs(lsps) do
  server_list[#server_list + 1] = server
end

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed       = server_list,
})

for server, options in pairs(lsps) do
  if type(options.manual_setup) == "function" then
    options.manual_setup()
  else
    require("lspconfig")[server].setup({
      on_attach = function(client, bufnr)
        if type(options.on_attach) == "function" then
          options.on_attach(client, bufnr)
        end
        on_attach_default(client, bufnr, options)
      end,
      settings = options.settings,
      capabilities = options.capabilities,
    })
  end
end

local signs = require("config.icons").Dianostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
