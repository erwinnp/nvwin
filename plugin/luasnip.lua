vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/L3MON4D3/LuaSnip' })

    require('luasnip.loaders.from_vscode').lazy_load()
  end,
})
