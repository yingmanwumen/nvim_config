require("dashboard").setup({
  theme         = "hyper",
  disable_move  = true,
  shortcut_type = "number",
  buffer_name   = "Dashboard",
  config        = {
    week_header = {
      enable = true,
    },
    packages = {
      enable = false,
    },
    project = {
      enable = false,
    },
    shortcut = {
      {
        icon    = "💤",
        icon_hl = "@variable",
        desc    = "Lazy",
        group   = "Label",
        action  = "Lazy",
        key     = "L",
      },
      {
        icon    = "🪨",
        icon_hl = "@variable",
        desc    = "Mason",
        group   = "Label",
        action  = "Mason",
        key     = "M",
      },
    },
    mru = {
      limit = 20,
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "", "Loaded " .. stats.count .. " plugins in " .. ms .. "ms 🕑" }
    end,
  },
  hide          = {
    statusline = true,
    tabline    = true,
  },
})
