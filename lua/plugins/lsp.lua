return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- LSP
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lsp_zero = require("lsp-zero").preset({
        call_servers = "local",
        configure_diagnostics = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = {
          preserve_mappings = false,
          omit = {},
        },
        manage_nvim_cmp = {
          set_sources = "recommended",
          set_basic_mappings = true,
          set_extra_mappings = true,
          use_luasnip = true,
          set_format = true,
          documentation_window = true,
        },
      })

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())

      lsp_zero.set_sign_icons({
        error = "⛔",
        warn = "⚠️",
        hint = "💡",
        info = "ℹ️",
      })

      vim.o.updatetime = 250

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focus = false,
            max_width = 80,
            max_height = 10,
            offset_x = 5,
            offset_y = 2,
          })
        end,
      })

      vim.diagnostic.config({
        virtual_text = { prefix = "🚧" },
        update_in_insert = true,
        float = { source = "always" },
      })

      lsp_zero.setup()
    end,
  },
}
