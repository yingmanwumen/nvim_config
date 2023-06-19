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

local set_keymappings = function(client, bufnr)
  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  end
  vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', { buffer = bufnr })
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', { buffer = bufnr })
  vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', { buffer = bufnr })
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

local on_attach_default = function(client, bufnr, options)
  set_keymappings(client, bufnr)
  set_codelens(client, bufnr)
  if type(options.autoformat) == "function" then
    options.autoformat(bufnr)
  else
    set_autoformat(client, bufnr)
  end
  set_inlayhints(client, bufnr)
  if client.server_capabilities.documentSymbolsProvider then
    require("nvim-navbuddy").attach(client, bufnr)
  end
end

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

local servers = {
  rust_analyzer = {
    manual_setup = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(client, bufnr)
            on_attach_default(client, bufnr)
          end,
          standalone = true,
        },
        tools = {
          inlay_hints = {
            auto = false,
          },
        },
      })
    end
  },

  pyright       = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "strict"
        }
      }
    },
    autoformat = function(bufnr)
      local group = vim.api.nvim_create_augroup("AutoFormat", { clear = false })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          modify_buffer(bufnr, function(file)
            vim.fn.execute("! black " .. file)
          end)
        end
      })
    end
  },

  sourcery      = {
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end
  },

  clangd        = require("config.plugins.clangd"),
  lua_ls        = require("config.plugins.lua_ls"),
  bashls        = {},
  cmake         = {},
  gopls         = {},
  jsonls        = {},
  vimls         = {},
  yamlls        = {},
  -- texlab = {},
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
  if options.manual_setup then
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
