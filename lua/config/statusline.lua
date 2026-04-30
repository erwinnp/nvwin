local modes = {
  ['n'] = 'NORMAL',
  ['no'] = 'O-PENDING',
  ['nov'] = 'O-PENDING',
  ['noV'] = 'O-PENDING',
  ['no'] = 'O-PENDING',
  ['niI'] = 'NORMAL',
  ['niR'] = 'NORMAL',
  ['niV'] = 'NORMAL',

  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['ix'] = 'INSERT',
  ['s'] = 'SELECT',
  ['S'] = 'SELECT',

  ['v'] = 'VISUAL',
  ['V'] = 'V-LINE',
  [''] = 'V-BLOCK',
  ['r'] = 'REPLACE',
  ['r?'] = 'CONFIRM',
  ['c'] = 'COMMAND',
  ['t'] = 'TERMINAL',
  ['!'] = 'SHELL',
  ['R'] = 'REPLACE',
}

local function git_branch()
  if vim.fn.winwidth(0) < 50 then
    return ''
  end

  local head = vim.b.gitsigns_head
  if head and head ~= '' then
    return string.upper(head) .. ' '
  end

  return ''
end

local function get_diag(severity, label)
  if vim.fn.winwidth(0) < 50 then
    return ''
  end
  local count = #vim.diagnostic.get(0, { severity = severity })
  return count > 0 and string.format('[%s%d] ', label, count) or ''
end

-- StatusLine Modes
Status = function()
  return table.concat({
    string.format('  %s ', modes[api.nvim_get_mode().mode]):upper(), -- mode
    '%#StatusActive#', -- middle color
    git_branch(),
    '%=', -- right align
    get_diag(vim.diagnostic.severity.ERROR, 'E'),
    get_diag(vim.diagnostic.severity.WARN, 'W'),
    '[Ln %l Col %c]', -- line, column
  })
end

-- Execute statusline
api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  pattern = '*',
  command = 'setlocal statusline=%!v:lua.Status()',
})
