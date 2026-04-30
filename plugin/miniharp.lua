vim.api.nvim_create_autocmd('BufReadPre', {
  once = true,
  callback = function()
    vim.pack.add({
      {
        src = 'https://github.com/vieitesss/miniharp.nvim',
        version = vim.version.range('v*'),
      },
    })

    local miniharp = require('miniharp')
    miniharp.setup({
      autoload = true,
      autosave = true,
      show_on_autoload = false,
      notifications = true,
      ui = {
        position = 'top-left',
        show_hints = true,
        enter = true,
      },
    })

    local function map(mode, key, cmd, desc)
      vim.keymap.set(
        mode,
        key,
        cmd,
        { desc = desc, noremap = true, silent = true }
      )
    end

    map('n', '<leader>m', miniharp.toggle_file, 'miniharp: toggle file mark')
    map('n', '<C-n>', miniharp.next, 'miniharp: next file mark')
    map('n', '<C-p>', miniharp.prev, 'miniharp: prev file mark')
    map('n', '<leader>l', miniharp.show_list, 'miniharp: toggle marks list')
    map('n', '<leader>L', miniharp.enter_list, 'miniharp: enter marks list')

    for i = 1, 5 do
      map('n', '<leader>' .. i, function()
        miniharp.go_to(i)
      end, 'miniharp: go to mark ' .. i)
    end
  end,
})
