return {
  -- Surround
  { "tpope/vim-surround", event = "VeryLazy" },

  -- Auto-close pairs (treesitter-aware, integrates with nvim-cmp)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
      local ok, cmp = pcall(require, "cmp")
      if ok then
        cmp.event:on(
          "confirm_done",
          require("nvim-autopairs.completion.cmp").on_confirm_done()
        )
      end
    end,
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Inline color previews (#rrggbb, rgb(), etc.)
  {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Undo history visualizer
  { "mbbill/undotree", cmd = "UndotreeToggle" },

  -- Prettier formatter
  {
    "prettier/vim-prettier",
    build = "npm install",
    cmd = "Prettier",
  },
}
