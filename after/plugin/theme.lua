vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['onedark_termcolors'] = 256
vim.g['airline_theme'] = 'simple'
vim.o.background = 'dark'
vim.cmd([[colorscheme onedark]])

require('onedark').setup {
  style = 'darker'
}

require('onedark').load()

