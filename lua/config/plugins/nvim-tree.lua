local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return {
      desc    = "nvim-tree: " .. desc,
      buffer  = bufnr,
      noremap = true,
      silent  = true,
      nowait  = true
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '[g', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']g', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Horizontal Split'))
  vim.keymap.set('n', 'K', api.node.show_info_popup, opts('Info'))
end

require("nvim-tree").setup({
  on_attach           = on_attach,
  sync_root_with_cwd  = true,
  respect_buf_cwd     = true,
  update_focused_file = {
    enable      = true,
    update_root = true,
  },
  filters             = {
    dotfiles = true,
  }
})
