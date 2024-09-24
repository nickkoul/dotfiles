
function SetRandomLineNrColor()
  math.randomseed(os.time())

  local colors = {
    "#b4befe", -- Lavendar
    "#eba0ac", -- Maroon
    "#d2fac5", -- Green
    "#cba6f7", -- Flamingo
    "#cba6f7", -- Mauve
    "#fcc6a7", -- Peach
    "#89b4fa", -- Blue
    "#89dceb", -- Sky
  }

  local index = math.random(#colors)
  vim.api.nvim_set_hl(0, "lineNr", { fg = colors[index], bold = true})
end

function ColorMyTerminal(color)
  color = color or "catppuccin-macchiato"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(color)

  SetRandomLineNrColor()

  -- Setting hihglights for lines above and below
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
end

ColorMyTerminal()
