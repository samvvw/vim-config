set relativenumber
set nu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set mouse=a
set wildmenu
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set confirm
set hidden
set history=1000
set spell
set nocompatible

call plug#begin('~/.vim/plugged/')

" COC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'mbbill/undotree'

" Emmet
Plug 'mattn/emmet-vim'
" Plug 'github/copilot.vim'

Plug 'turbio/bracey.vim'
" syntax
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
"" indent lines
Plug 'yggdroot/indentline'

"NerdTree
" Plug 'preservim/nerdtree'

" Surround quotes, parenthesis and tags
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

"Telescope fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'



" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSS Colors
Plug 'ap/vim-css-color'

" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}


call plug#end()

" Coc settings
" let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-emmet', 'coc-eslint', 'coc-solargraph', 'coc-elixir', 'coc-go', 'coc-rust-analyzer', 'coc-python', 'coc-jedi']

colorscheme onedark
let g:onedark_termcolors=256

let g:gruvbox_contrast_dark=1
set bg=dark
highlight Normal guibg=none

let g:airline_theme="murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:indentLine_setColors = 0


let mapleader = ' '

" nvim-tree config
" let g:netrw_liststyle = 3
let g:netrw_altv = 2
let g:netrw_winsize = 80

" Buffer navigation
nnoremap <leader><TAB> :bn<CR>
nnoremap <leader><s-TAB> :bp<CR>

" Move lines
vnoremap J :m '>+1'<CR>gv=gv
vnoremap K :m '<-2'<CR>gv=gv

" Append line to end of current line
nnoremap J mzJ`z

" Keeps cursor in the middle of the screen when scrolling with C-(d|u)
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

" nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>nt :Ex<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :Ex<CR>
inoremap jj <ESC>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Paste from clipboard
" nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"Telescope remaps
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>

" Undotree remaps
nnoremap <leader>== :UndotreeToggle<CR>

" Coc remaps
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Coc remaps end
fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup SAM_CONF
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
augroup END


" LSP SETTINGS LUA
"
lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		update_in_insert = false,
		virtual_text = { spacing = 4, prefix = "⭕" },
		severity_sort = true,
	}
)

local  signs = { Error = "☢ ", Warn = "⚠ ", Hint = "H", Info = "I" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
virtual_text = {
		prefix = "🔅"
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("SamV_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

lsp.setup()
EOF
