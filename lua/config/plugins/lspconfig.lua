local utils = require("config.plugins.lspconfig_utils")
local on_attach_default = utils.on_attach_default

local lsps = {
  sourcery      = {
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end
  },

  clangd        = require("config.plugins.clangd"),
  lua_ls        = require("config.plugins.lua_ls"),
  pyright       = require("config.plugins.pyright"),
  rust_analyzer = require("config.plugins.rust_analyzer"),
  bashls        = {
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = true
    end
  },
  neocmake      = {},
  gopls         = {},
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
