vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.api.nvim_create_autocmd('PackChanged', {
      callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
          if not ev.data.active then
            vim.cmd.packadd('nvim-treesitter')
          end
          vim.cmd('TSUpdate')
        end
      end,
    })

    vim.pack.add({
      {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main',
      },
    }, {
      load = function(plugin)
        vim.cmd.packadd(plugin.spec.name)
        vim.opt.runtimepath:append(plugin.path .. '/runtime')
      end,
    })

    require('nvim-treesitter').install({
      'go',
      'javascript',
      'typescript',
      'tsx',
      'lua',
      'html',
      'css',
      'markdown',
      'markdown_inline',
      'sql',
      'yaml',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        if not lang then
          return
        end

        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
          return
        end

        pcall(vim.treesitter.start, buf, lang)

        if ft ~= 'yaml' and ft ~= 'markdown' then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.bo[buf].smartindent = false
          vim.bo[buf].cindent = false
        end
      end,
    })
  end,
})
