local clang_config = require("config.plugins.clangd")
require("clangd_extensions").setup({
  server = {
    capabilities = clang_config.capabilities,
    on_attach = function(client, bufnr)
      require("config.plugins.lspconfig_utils").on_attach_default(client, bufnr, clang_config)
    end
  },
  extensions = {
    autoSetHints = false,
    ast = {
      -- These are unicode, should be available in any font
      role_icons = {
        type = "🄣",
        declaration = "🄓",
        expression = "🄔",
        statement = ";",
        specifier = "🄢",
        ["template argument"] = "🆃",
      },
      kind_icons = {
        Compound = "🄲",
        Recovery = "🅁",
        TranslationUnit = "🅄",
        PackExpansion = "🄿",
        TemplateTypeParm = "🅃",
        TemplateTemplateParm = "🅃",
        TemplateParamObject = "🅃",
      },
      highlights = {
        detail = "Comment",
      },
    },
  },
})
