return {
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },
  { "f-person/git-blame.nvim", event = "VeryLazy" },

  -- Git signs in the sign column + hunk actions
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end
          map("n", "]h", function() gs.nav_hunk("next") end, "Next git hunk")
          map("n", "[h", function() gs.nav_hunk("prev") end, "Previous git hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        end,
      })
    end,
  },
}
