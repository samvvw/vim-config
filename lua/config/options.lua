local opt = vim.opt

opt.number = true
opt.errorbells = false

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.scrolloff = 8
opt.mouse = "a"
opt.wildmenu = true
opt.history = 10000
opt.confirm = true
opt.hidden = true
opt.spell = true

-- Persistent undo, no swap/backup files
local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.fn.mkdir(undodir, "p")
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = undodir

-- netrw
vim.g.netrw_preview = 1
vim.g.netrw_altv = 2
vim.g.netrw_winsize = 50
