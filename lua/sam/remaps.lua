vim.g.mapleader = ' '

-- switch tabs
vim.keymap.set('n', '<leader><TAB>', ':bn<CR>')
vim.keymap.set('n', '<leader><s-TAB>', ':bp<CR>')


-- save and exit buffers
vim.keymap.set('n', '<leader>nt', ':Ex<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':Ex<CR>')

-- Escape insert mode
vim.keymap.set('i', 'jj', '<ESC>')

-- Line movement
-- up and down
vim.keymap.set('v', 'J', ":m '>+1'<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2'<CR>gv=gv")
-- append to end of line
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep cursor in the middle of the screen when moving through search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- keep cursor in the middle of the screen when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')

-- paste from clipboard
vim.keymap.set('v', '<leader>P', '"+P')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>p', '"+P')

-- telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')

-- Git fugitive
vim.keymap.set('n', '<leader>gs', ':Git<CR>')

-- Undo tree remaps
vim.keymap.set('n', '<leader>==', ':UndotreeToggle<CR>')

