local utils = require("config.plugins.lspconfig_utils")

local on_attach_default = utils.on_attach_default

local servers = {
  sourcery      = {
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end
  },

  clangd        = require("config.plugins.clangd"),
  lua_ls        = require("config.plugins.lua_ls"),
  pyright       = require("config.plugins.pyright"),
  rust_analyzer = require("config.plugins.rust_analyzer"),
  bashls        = {},
  cmake         = {},
  gopls         = {},
  jsonls        = {},
  vimls         = {},
  yamlls        = {},
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

for server, options in pairs(servers) do
  if type(options.manual_setup) == "function" then
    options.manual_setup()
  else
    require("lspconfig")[server].setup({
      on_attach = function(client, bufnr)
        on_attach_default(client, bufnr, options)
        if type(options.on_attach) == "function" then
          options.on_attach(client, bufnr)
        end
      end,
      settings = options.settings,
      root_dir = options.root_dir,
    })
  end
end

local signs = require("config.icons").Dianostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
