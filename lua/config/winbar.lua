local function file_name()
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)

  if vim.bo.buftype ~= '' or file == '' then
    return ''
  end

  if vim.fn.winwidth(0) < 50 then
    file = vim.fn.fnamemodify(file, ':t')
  else
    file = vim.fn.fnamemodify(file, ':.')
  end

  if vim.bo.filetype == '' then
    return file
  end

  local readonly = vim.bo.readonly and '[RO] ' or ''
  local modified = vim.bo.modified and '[+] ' or ''

  return '  ' .. readonly .. modified .. file .. ' '
end

function Winbar()
  return table.concat({
    file_name(),
  })
end

local function hide_winbar(buf)
  local ignore_filetypes = {
    'help',
    'terminal',
    'minifiles',
  }
  return not buf
    or vim.api.nvim_buf_get_name(buf) == ''
    or vim.tbl_contains(ignore_filetypes, vim.bo[buf].filetype)
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufLeave' }, {
  group = vim.api.nvim_create_augroup('Winbar', { clear = true }),
  pattern = '*',
  callback = function(args)
    if hide_winbar(args.buf) then
      return
    end

    vim.opt_local.winbar = '%{%v:lua.Winbar()%}'
  end,
})
