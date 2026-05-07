local function show_dashboard()
  if vim.fn.argc() ~= 0 then
    return
  end

  local buf = vim.api.nvim_get_current_buf()

  if
    vim.bo[buf].buftype ~= 'nofile' and vim.bo[buf].filetype ~= 'dashboard'
  then
    return
  end

  vim.bo[buf].modifiable = true

  local logo = {
    '        Neovim 0.12        ',
    ' It works on my machine :) ',
    '---------------------------',
    '',
    '[ff]               MiniPick',
    '[q]                Quit    ',
  }

  local width = vim.api.nvim_win_get_width(0)
  local height = vim.api.nvim_win_get_height(0)

  local centered_logo = {}
  for _, line in ipairs(logo) do
    local padding = math.max(0, math.floor((width - #line) / 2))
    table.insert(centered_logo, string.rep(' ', padding) .. line)
  end

  local final_lines = {}
  local vertical_padding = math.max(0, math.floor((height - #logo) / 2))
  for _ = 1, vertical_padding do
    table.insert(final_lines, '')
  end
  for _, line in ipairs(centered_logo) do
    table.insert(final_lines, line)
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, final_lines)

  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = 'dashboard'
  vim.api.nvim_buf_set_name(buf, '')

  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.cursorline = false
  vim.opt_local.statusline = ' '

  local opts = { noremap = true, silent = true, buffer = buf }
  vim.keymap.set('n', 'q', '<cmd>qa<CR>', opts)
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_win_set_buf(0, buf)
      show_dashboard()
    end
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  callback = show_dashboard,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.filetype ~= 'dashboard' and vim.bo.buftype == '' then
      vim.wo.number = true
      vim.wo.relativenumber = true
      vim.wo.statusline = ''
    end
  end,
})
