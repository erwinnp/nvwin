local function map(mode, key, cmd, desc)
  vim.keymap.set(mode, key, cmd, { desc = desc, noremap = true, silent = true })
end

local terminal = require('config.terminal')

map('n', 'tt', terminal.create_terminal, 'Open Terminal')

-- Window Management
map('n', '<S-h>s', ':split<CR>', 'Window: Horizontal Split')
map('n', '<S-v>s', ':vs<CR>', 'Window: Vertical Split')
map('n', '<C-h>', '<C-w>h', 'Window: Move to left')
map('n', '<C-l>', '<C-w>l', 'Window: Move to right')
map('n', '<leader>x', ':bd<CR>', 'Window: Close buffer')

-- File & Buffer Operations
map('n', '<leader>s', ':w<CR>', 'File: Save buffer')
map('n', '<leader>t', ':enew<CR>', 'File: New empty buffer')
map('n', 'ff', ':lua MiniFiles.open()<CR>', 'File: Open MiniFiles')

-- Search & Navigation
map('n', '<ESC>', ':nohlsearch<CR>', 'Search: Clear highlight')

-- Miscellaneous
map('n', 'Q', '<nop>', 'Misc: Disable Q key')

-- Insert Mode Helpers
map('i', '<C-E>', '<End>', 'Insert: Jump to end of line')
map('i', '<C-A>', '<Home>', 'Insert: Jump to start of line')
map('i', 'jj', '<Esc>', 'Insert: Exit to Normal mode')

-- Save file (Cross-mode)
map('i', '<C-S>', '<ESC>:w<CR><Insert>', 'Insert: Save and resume')
map('n', '<C-S>', ':w<CR>', 'Normal: Save buffer')
