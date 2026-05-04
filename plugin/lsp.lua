vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/mason-org/mason-lspconfig.nvim',
      'https://github.com/neovim/nvim-lspconfig',
      'https://github.com/mason-org/mason.nvim',
      'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    })

    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'cssls',
        'html',
        'ts_ls',
        'tailwindcss',
        'emmet_ls',
        'gopls',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = { 'eslint', 'prettier', 'stylua' },
    })

    -- Diagnostic Config
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = 'single',
        source = true,
        focusable = false,
        style = 'minimal',
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      },
    })

    -- LSP Attach logic
    local goto_diagnostic = function(next, severity)
      return function()
        vim.diagnostic.jump({
          count = next and 1 or -1,
          float = true,
          severity = severity and vim.diagnostic.severity[severity] or nil,
        })
      end
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup(
        'kickstart-lsp-attach',
        { clear = true }
      ),
      callback = function(event)
        local opts = { buffer = event.buf, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set(
          'n',
          '<leader>wa',
          vim.lsp.buf.add_workspace_folder,
          opts
        )
        vim.keymap.set(
          'n',
          '<leader>wr',
          vim.lsp.buf.remove_workspace_folder,
          opts
        )
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>da', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', ']e', goto_diagnostic(true, 'ERROR'), opts)
        vim.keymap.set('n', '[e', goto_diagnostic(false, 'ERROR'), opts)
        vim.keymap.set('n', ']w', goto_diagnostic(true, 'WARN'), opts)
        vim.keymap.set('n', '[w', goto_diagnostic(false, 'WARN'), opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
      end,
    })

    -- LSP Configs
    vim.lsp.config(
      '*',
      { capabilities = require('blink.cmp').get_lsp_capabilities() }
    )

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config('emmet_ls', {
      filetypes = {
        'html',
        'typescriptreact',
        'javascriptreact',
        'css',
        'sass',
        'scss',
        'less',
        'svelte',
      },
    })

    vim.lsp.config('ts_ls', {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
      single_file_support = true,
      init_options = {
        preferences = {
          includeCompletionsForModuleExports = true,
          includeCompletionsForImportStatements = true,
        },
      },
    })

    vim.lsp.config('gopls', {
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    vim.lsp.config('cssls', {
      filetypes = { 'css', 'scss', 'less' },
      init_options = { provideFormatter = true },
      settings = {
        css = {
          lint = {
            unknownAtRules = 'ignore',
          },
          validate = true,
        },
        scss = {
          lint = {
            unknownAtRules = 'ignore',
          },
          validate = true,
        },
        less = {
          lint = {
            unknownAtRules = 'ignore',
          },
          validate = true,
        },
      },
    })

    vim.lsp.config('tailwindcss', {
      filetypes = {
        'html',
        'css',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
      },
    })

    vim.lsp.enable({
      'lua_ls',
      'ts_ls',
      'gopls',
      'cssls',
      'html',
      'tailwindcss',
      'emmet_ls',
    })
  end,
})
