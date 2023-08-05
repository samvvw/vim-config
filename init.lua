require('sam')
require('plugins')



-- airline settings




-- airline settings




vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['onedark_termcolors'] = 256
vim.g['airline_theme'] = 'simple'
vim.o.background = 'dark'
vim.cmd([[colorscheme onedark]])

vim.g.netrw_altv = 2
vim.g.netrw_winsize = 80




-- Undotree settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

