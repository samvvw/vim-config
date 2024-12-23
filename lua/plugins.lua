vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'prettier/vim-prettier', run = 'npm install' }
	-- Git
	use 'tpope/vim-fugitive'
	use 'airblade/vim-gitgutter'
	use 'f-person/git-blame.nvim'

	-- Emmet
	-- Plug 'mattn/emmet-vim'

	-- Undotree
	use 'mbbill/undotree'

	-- syntax
	use 'scrooloose/syntastic'
	--	use 'mxw/vim-jsx'
	--	use 'leafgarland/typescript-vim'
	--  indent lines
	use 'yggdroot/indentline'

	-- Surround quotes, parenthesis and tags
	use 'tpope/vim-surround'
	use 'jiangmiao/auto-pairs'

	-- Telescope fuzzy finder
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	}
	-- Theme
	use 'morhetz/gruvbox'
	use 'navarasu/onedark.nvim'
	use 'rose-pine/neovim'
	use 'folke/tokyonight.nvim'

	use 'sheerun/vim-polyglot'


	-- Debugger
	use { 'puremourning/vimspector', run = 'python3 install_gadget.py --enable-rust' }


	-- Status bar
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- Icons
	use  'nvim-tree/nvim-web-devicons'

	-- CSS Colors
	use 'ap/vim-css-color'

	-- Copilot
	use 'github/copilot.vim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end, }
end)
