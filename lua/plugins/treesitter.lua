return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vimdoc", "javascript", "typescript", "c", "lua", "rust",
          "jsdoc", "bash", "ruby", "elixir",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "markdown" },
        },
      })

      -- Enable treesitter-based folding once a buffer is loaded, but keep
      -- everything unfolded by default.
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
          vim.defer_fn(function()
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldlevel = 99
          end, 100)
        end,
      })
    end,
  },
}
