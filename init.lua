require('sam')
require('plugins')

function SourceConfig()
    local files = vim.fn.glob('~/.config/nvim/autoload/*')

    for _, f in ipairs(vim.split(files, '\n')) do
        vim.cmd('source ' .. f)
    end

    dofile(vim.fn.expand('$MYVIMRC'))
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
