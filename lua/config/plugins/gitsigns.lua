require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    map("n", "]h", gs.next_hunk, "Next Hunk")
    map("n", "[h", gs.prev_hunk, "Prev Hunk")
    map("n", "<leader>hp", gs.preview_hunk_inline, "Preview Hunk")
    map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle Git Blame")
    map("n", "<leader>hl", gs.toggle_linehl, "Toggle Line highlight")
    map("n", "<leader>hd", gs.diffthis, "Git Diff")
    map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
  end,
})
