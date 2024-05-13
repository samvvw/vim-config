require('sam')
require('plugins')

function SourceConfig()
    local files = vim.fn.glob('~/.config/nvim/autoload/*')

    for _, f in ipairs(vim.split(files, '\n')) do
        vim.cmd('source ' .. f)
    end

    dofile(vim.fn.expand('$MYVIMRC'))
end
