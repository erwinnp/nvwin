g.mapleader = ' '

-- basic
opt.scrolloff = 8
opt.mouse = 'a'
opt.title = true
opt.titlestring = '%f'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.undofile = true
opt.cmdheight = 1
opt.termguicolors = true
opt.showmode = false
opt.cul = true

-- timeout stuff
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 10

-- status, tab, number, sign line
opt.ruler = false
opt.laststatus = 3
opt.showtabline = 0
opt.number = true
opt.numberwidth = 1
opt.relativenumber = true
opt.signcolumn = 'yes'

-- window, buffer, tabs
opt.switchbuf = 'newtab'
opt.splitbelow = true
opt.splitright = true
opt.winborder = 'single'
opt.hidden = true
vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
  eob = ' ',
}

-- text formatting
opt.textwidth = 60
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.showmatch = true
opt.smartcase = true
opt.whichwrap:append('<>[]hl')
opt.breakindent = true
opt.linebreak = true

-- remove intro
opt.shortmess:append('sI')

-- Default shell
o.shell = 'pwsh.exe'
o.shellxquote = ''
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
o.shellquote = ''
o.shellpipe = '| Out-File -Encoding UTF8 %s'
o.shellredir = '| Out-File -Encoding UTF8 %s'

-- disable inbuilt vim plugins
local built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in pairs(built_ins) do
  g['loaded_' .. plugin] = 1
end
