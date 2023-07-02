local function on_attach(buffer)
  local gs = package.loaded.gitsigns
  local function map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
  end

  map("n", "]g", gs.next_hunk, "Next Hunk")
  map("n", "[g", gs.prev_hunk, "Prev Hunk")
  map("n", "<leader>gi", gs.preview_hunk_inline, "Inline Preview Hunk")
  map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
  map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle Git Blame")
  map("n", "<leader>gl", gs.toggle_linehl, "Toggle Line highlight")
  map("n", "<leader>gd", gs.diffthis, "Git Diff")
  map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
end

require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    changedelete = { text = "▎" },
    untracked    = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
  },
  on_attach = on_attach
})
