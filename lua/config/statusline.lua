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
    return '| ' .. string.upper(head) .. ' '
  end

  return ''
end

local function get_diag(severity, label)
  if vim.fn.winwidth(0) < 50 then
    return ''
  end
  local count = #vim.diagnostic.get(0, { severity = severity })
  return count > 0 and string.format('[%s:%d] ', label, count) or ''
end

local function file_type()
  local ft = vim.bo.filetype
  if ft == '' then
    return ''
  end

  local aliases = {
    typescriptreact = 'TSX',
    javascriptreact = 'JSX',
    javascript = 'JS',
    typescript = 'TS',
  }

  local display_name = aliases[ft] or ft:upper()

  return display_name .. ' '
end

-- StatusLine Modes
Status = function()
  return table.concat({
    string.format(' %s ', modes[api.nvim_get_mode().mode]):upper(),
    git_branch(),
    '%=', -- right align
    '%#DiagnosticError#',
    get_diag(vim.diagnostic.severity.ERROR, 'E'),
    '%#DiagnosticWarn#',
    get_diag(vim.diagnostic.severity.WARN, 'W'),
    '%#DiagnosticInfo#',
    get_diag(vim.diagnostic.severity.INFO, 'I'),
    '%#DiagnosticHint#',
    get_diag(vim.diagnostic.severity.HINT, 'H'),
    '%#MsgArea#',
    '[Ln %l Col %c] ',
    file_type(),
  })
end

-- Execute statusline
api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  pattern = '*',
  command = 'setlocal statusline=%!v:lua.Status()',
})
