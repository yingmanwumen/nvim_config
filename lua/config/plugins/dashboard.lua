require("dashboard").setup({
  theme = "hyper",
  disable_move = true,
  shortcut_type = "number",
  buffer_name = "Dashboard",
  config = {
    week_header = {
      enable = true,
    },
    packages = {
      enable =false
    },
    project = {
      enable = false,
    },
    shortcut = {
      {
        icon    = '🔭',
        icon_hl = '@variable',
        group   = 'Label',
        desc    = "Update",
        action  = "Lazy update",
        key     = "U",
      },
      {
        icon    = '👒',
        icon_hl = '@variable',
        group   = 'Label',
        desc    = "CocUpdate",
        action  = "CocUpdate",
        key     = "C",
      },
      {
        icon    = '🔍',
        icon_hl = '@variable',
        desc    = 'Files',
        group   = 'Label',
        action  = 'Telescope find_files',
        key     = 'F',
      },
      {
        icon    = '💤',
        icon_hl = '@variable',
        desc    = 'Lazy',
        group   = 'Label',
        action  = 'Lazy',
        key     = 'L',
      },
    },
    mru = {
      limit = 20
    },
    footer = function ()
      ---@diagnostic disable-next-line: different-requires
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "", "Loaded " .. stats.count .. " plugins in " .. ms .. "ms 🕑" }
    end,
  },
  hide = {
    statusline = true,
    tabline    = true,
  },
})

