vim.api.nvim_create_autocmd('LspAttach', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/j-hui/fidget.nvim' })

    require('fidget').setup({
      notification = {
        window = {
          normal_hl = 'Normal',
          align = 'bottom',
          relative = 'editor',
        },
      },
    })
  end,
})
