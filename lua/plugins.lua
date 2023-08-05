vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
--	use { 'prettier/vim-prettier', run = 'npm install' }
	-- Git
	use 'tpope/vim-fugitive'
	use 'airblade/vim-gitgutter'

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
	use 'nvim-telescope/telescope.nvim'

	-- Theme
	use 'morhetz/gruvbox'
	use 'joshdick/onedark.vim'
	use 'sheerun/vim-polyglot'



	-- Status bar
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- CSS Colors
	use 'ap/vim-css-color'

	  use {
		  'VonHeikemen/lsp-zero.nvim',
		  branch = 'v1.x',
		  requires = {
			  -- LSP Support
			  {'neovim/nvim-lspconfig'},
			  {'williamboman/mason.nvim'},
			  {'williamboman/mason-lspconfig.nvim'},

			  -- Autocompletion
			  {'hrsh7th/nvim-cmp'},
			  {'hrsh7th/cmp-buffer'},
			  {'hrsh7th/cmp-path'},
			  {'saadparwaiz1/cmp_luasnip'},
			  {'hrsh7th/cmp-nvim-lsp'},
			  {'hrsh7th/cmp-nvim-lua'},

			  -- Snippets
			  {'L3MON4D3/LuaSnip'},
			  {'rafamadriz/friendly-snippets'},
		  }
	  }
end)
