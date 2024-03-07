local map = vim.keymap.set

local function neovideScale(amount)
  local temp = vim.g.neovide_scale_factor + amount

  if temp < 0.5 then
    return
  end

  vim.g.neovide_scale_factor = temp
end

map("n", "<C-=>",
  function()
    neovideScale(0.1)
  end
)

map("n", "<C-->",
  function()
    neovideScale(-0.1)
  end
)

map("n", "<F11>",
  function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end
)
