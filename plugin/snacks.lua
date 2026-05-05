vim.api.nvim_create_autocmd('BufReadPre', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

    local snacks = require('snacks')
    snacks.setup()

    local function map(mode, key, cmd, desc)
      vim.keymap.set(
        mode,
        key,
        cmd,
        { desc = desc, noremap = true, silent = true }
      )
    end

    map('n', '<leader>lz', function()
      snacks.lazygit()
    end, 'Lazygit')
  end,
})
