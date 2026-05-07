vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })

require('vague').setup({
  transparent = true,
  bold = false,
  italic = false,
  on_highlights = function(hl, colors)
    hl.StatusLine.bg = nil
    hl.StatusLineNC.bg = nil
    hl.CursorLine.bg = nil
    hl.BlinkCmpMenuSelection = { fg = colors.fg, bg = colors.line }
    hl.WinBar.bg = nil
    hl.WinBarNC.bg = nil
  end,
})

vim.cmd('colorscheme ways')
-- vim.cmd.colorscheme('vague')
