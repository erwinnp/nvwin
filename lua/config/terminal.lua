local M = {}

M.create_window = function()
  local max_height = vim.api.nvim_win_get_height(0)
  local max_width = vim.api.nvim_win_get_width(0)

  local height = math.floor(max_height * 0.5)
  local width = math.floor(max_width * 0.5)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    height = height,
    width = width,
    col = (max_width - width) / 2,
    row = (max_height - height) / 2,
  })
end

M.create_terminal = function()
  M.create_window()
  vim.cmd.term()
  vim.cmd('startinsert')

  local buf = vim.api.nvim_get_current_buf()
  vim.keymap.set('n', 'q', ':q<CR>', { buffer = buf, silent = true })
  vim.keymap.set(
    't',
    '<Esc>',
    [[<C-\><C-n>]],
    { desc = 'Exit Terminal Insert Mode' }
  )
end

return M
