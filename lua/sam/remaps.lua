vim.g.mapleader = ' '


-- switch tabs
vim.keymap.set('n', '<leader><TAB>', ':bn<CR>')
vim.keymap.set('n', '<leader><s-TAB>', ':bp<CR>')

-- save and exit buffers
vim.keymap.set('n', '<leader>nt', ':Ex<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':Ex<CR>')
vim.keymap.set('n', '<leader>Q', ':bd<CR>')
vim.keymap.set('n', '<leader>W', ':%bd|e#<CR>')

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
vim.keymap.set('n', '*', '*zzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '#', '#zzzv')

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
vim.keymap.set('n', '<leader>P', '"+p')

-- telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<CR>')
-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')

-- Git fugitive
vim.keymap.set('n', '<leader>gs', ':Git<CR>')

-- Undo tree remaps
vim.keymap.set('n', '<leader>==', ':UndotreeToggle<CR>')
vim.keymap.set('n', '<leader>p', ':Prettier<CR>')

-- Window management
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')
vim.keymap.set('n', '<leader>hs', ':split<CR>')

-- Continue
vim.keymap.set('n', '<leader>dr', '<Plug>VimspectorContinue')
-- Stop
vim.keymap.set('n', '<leader>ds', '<Plug>VimspectorStop')
-- Restart
vim.keymap.set('n', '<leader>dq', '<Plug>VimspectorRestart')
-- Run to cursor
vim.keymap.set('n', '<leader>dc', '<Plug>VimspectorRunToCursor')
-- Step over
vim.keymap.set('n', '<leader>SO', '<Plug>VimspectorStepOver')
-- Step into
vim.keymap.set('n', '<leader>SI', '<Plug>VimspectorStepInto')
-- Step out
vim.keymap.set('n', '<leader>SQ', '<Plug>VimspectorStepOut')


-- Toggle Breakpoint
vim.keymap.set('n', '<leader>do', '<Plug>VimspectorToggleBreakpoint')
-- Toggle Conditional Breakpoint
vim.keymap.set('n', '<leader>dO', '<Plug>VimspectorToggleConditionalBreakpoint')
-- Toggle Functional Breakpoint
vim.keymap.set('n', '<leader>dF', '<Plug>VimspectorToggleFunctionalBreakpoint')

-- Debug inspect
vim.keymap.set('n', '<leader>dp', '<Plug>VimspectorBalloonEval')
vim.keymap.set('x', '<leader>dp', '<Plug>VimspectorBalloonEval')

-- Copilot
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.g['copilot_no_tab_map'] = true


vim.keymap.set('n', '<leader><leader>r', ':lua SourceConfig()<CR>')

vim.keymap.set('n', '<leader><leader>cs',':lua ChangeTheme()<CR>')

-- Terminal mode
vim.keymap.set('t', '<C-w>n', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>vt', ':vsplit <CR>:term <CR>', { desc = 'Enter verital terminal mode' })
vim.keymap.set('n', '<leader>ht', ':split <CR>:term <CR>', { desc = 'Enter horizontal terminal mode' })
