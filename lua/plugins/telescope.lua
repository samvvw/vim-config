return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "vendor",
            "deps",
            "_build",
            ".elixir_ls",
            ".git",
          },
        },
      })
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
