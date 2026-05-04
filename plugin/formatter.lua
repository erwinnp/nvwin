vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        go = { 'gofumpt', 'goimports', 'golines' },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
      },
      formatters = {
        prettier = {
          prepend_args = function(self, ctx)
            local found = vim.fs.find(
              { '.prettierrc', '.prettierrc.json', 'prettier.config.js' },
              { upward = true, path = ctx.dirname }
            )[1]

            if not found then
              return {
                '--single-quote',
                '--jsx-single-quote',
                '--config-precedence',
                'prefer-file',
              }
            end
            return {}
          end,
        },
      },
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        conform.format({ bufnr = args.buf, lsp_fallback = true })
      end,
    })

    vim.keymap.set('n', '<leader>fm', function()
      conform.format({ lsp_fallback = true })
    end, { desc = 'Code format' })
  end,
})
