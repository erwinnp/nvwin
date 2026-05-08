fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g
o = vim.o

cmd.colorscheme('heuvel')
require('config.keymaps')
require('config.options')
require('config.autocmds')
require('config.dashboard')
require('config.statusline')
require('config.winbar')
