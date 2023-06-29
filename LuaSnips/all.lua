local luasnip       = require("luasnip")
local snippet       = luasnip.snippet
local text_node     = luasnip.text_node
local insert_node   = luasnip.insert_node
local function_node = luasnip.function_node

local function box(full)
  local box_width = function(cs, input_text)
    local width = #input_text + 2 * (#cs + 1)
    if full then
      width = math.max(width, 80)
    end
    return width
  end

  local padding = function(cs, input_text)
    local spaces = box_width(cs, input_text) - (2 * #cs)
    spaces = spaces - #input_text
    return math.max(1, spaces / 2)
  end

  local comment_string = function()
    return require("luasnip.util.util").buffer_comment_chars()[1]
  end

  return {

    function_node(
      function(args)
        local cs = comment_string()
        return string.rep(string.sub(cs, 1, 1), box_width(cs, args[1][1]))
      end,
      { 1 }
    ),
    text_node({ "", "" }),
    function_node(
      function(args)
        local cs = comment_string()
        return cs .. string.rep(" ", math.floor(padding(cs, args[1][1])))
      end, { 1 }
    ),
    insert_node(1, "placeholder"),
    function_node(
      function(args)
        local cs = comment_string()
        return string.rep(" ", math.ceil(padding(cs, args[1][1]))) .. cs
      end, { 1 }
    ),
    text_node({ "", "" }),
    function_node(
      function(args)
        local cs = comment_string()
        return string.rep(string.sub(cs, 1, 1), box_width(cs, args[1][1]))
      end, { 1 }
    ),
  }
end

require("luasnip").add_snippets("all", {
  snippet({ trig = "box" }, box()),
  snippet({ trig = "bbox" }, box(true)),
})
