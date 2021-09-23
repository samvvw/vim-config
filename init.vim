syntax enable
set relativenumber
set nu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
" set nowrap
set scrolloff=8

set wildmenu
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set confirm
set hidden
set history=1000
set spell

call plug#begin('~/.vim/plugged')

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Emmet
Plug 'mattn/emmet-vim'

" syntax
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
"" indent lines
Plug 'yggdroot/indentline'

"NerdTree
Plug 'preservim/nerdtree'

" Surround quotes, parenthesis and tags
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

"Telescope fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theme
Plug 'morhetz/gruvbox'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSS Colors
Plug 'ap/vim-css-color'


call plug#end()


colorscheme gruvbox
highlight Normal guibg=none

let g:airline_theme="simple"
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

nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap jj <ESC>

" Telescope remaps
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>



fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup SAM_CONF
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
augroup END













