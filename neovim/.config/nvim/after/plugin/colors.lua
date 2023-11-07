
function ColorMyTerminal(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#585b70'})
  vim.api.nvim_set_hl(0, 'LineNr', { fg='#a6adc8'})
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#585b70'})
end

ColorMyTerminal()
