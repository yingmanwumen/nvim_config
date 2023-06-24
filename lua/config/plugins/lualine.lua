local function macro_recording()
  local mode = require("noice").api.statusline.mode.get()
  if mode then
    return string.match(mode, "^recording @.*") or ""
  end
  return ""
end

require("lualine").setup({
  options = {
    globalstatus = true,
    disabled_filetypes = {
      statusline = {
        "lazy",
        "dashboard",
      },
    },
    extensions = { "lazy" },
    refresh = { statusline = 150 }
  },
  sections = {
    lualine_c = {
      "filename",
      macro_recording,
    }
  }
})
