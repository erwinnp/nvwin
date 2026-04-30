local M = {}

M.load_plugin = function(events, plugin_spec, setup_func)
  local event_list = type(events) == 'table' and events or { events }

  for _, event in ipairs(event_list) do
    vim.api.nvim_create_autocmd(event, {
      once = true,
      callback = function()
        local specs = type(plugin_spec) == 'table' and plugin_spec
          or { plugin_spec }

        vim.pack.add(specs)

        if setup_func then
          setup_func()
        end
      end,
    })
  end
end

return M
