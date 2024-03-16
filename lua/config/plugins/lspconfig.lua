-- vim.lsp.set_log_level(vim.log.levels.OFF)

local utils = require("config.plugins.lspconfig_utils")
local on_attach_default = utils.on_attach_default

local lsps = {
  -- sourcery      = {
  --   on_attach = function(client, _)
  --     client.server_capabilities.hoverProvider = false
  --   end
  -- },

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
    settings = require("config.plugins.lsp.clangd").settings,
    filetypes = require("config.plugins.lsp.clangd").filetypes,
  },

  lua_ls        = require("config.plugins.lsp.lua_ls"),
  pyright       = require("config.plugins.lsp.pyright"),
  rust_analyzer = require("config.plugins.lsp.rust_analyzer"),
  typst_lsp     = require("config.plugins.lsp.typst"),

  -- gopls         = require("config.plugins.lsp.go"),

  dotls         = {},
  gopls         = {},
  neocmake      = {},
  jsonls        = {},
  vimls         = {},
  yamlls        = {},
  bufls         = {},
  -- lemminx       = {},
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
      filetypes = options.filetypes,
    })
  end
end

local signs = require("config.icons").Dianostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local local_lsps = {
  lsp_name = {
    cmd = { "command" },
    filetypes = { "filetypes" },
    root_dir = function()
      return vim.fn.getcwd()
    end,
    settings = {}
  }
}

for server, options in pairs(local_lsps) do
  require("lspconfig.configs")[server] = {
    default_config = options
  }
  require('lspconfig')[server].setup({})
end

-- vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "single",
-- })
