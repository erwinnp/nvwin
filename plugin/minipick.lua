vim.pack.add({ 'https://github.com/nvim-mini/mini.files' })

local ok, minifiles = pcall(require, 'mini.files')

if not ok then
  return
end

minifiles.setup()
