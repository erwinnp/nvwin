vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })

require('vague').setup({
  bold = false,
  italic = false,
})

vim.cmd.colorscheme('vague')

vim.api.nvim_set_hl(0, 'StatusLine', { bg = nil })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = nil })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = nil })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { bg = nil })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = nil })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = nil })
vim.api.nvim_set_hl(0, 'WinBar', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = 'NONE' })
