vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add({
      {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('1.*'),
      },
    })

    local blink = require('blink.cmp')
    blink.setup({
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'normal',
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        menu = {
          border = nil,
          scrolloff = 1,
          scrollbar = false,
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', 'label_description', gap = 1 },
              { 'kind' },
              { 'source_name' },
            },
          },
        },
        documentation = {
          window = {
            border = nil,
            scrollbar = false,
          },
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
        },
      },
    })
  end,
})
