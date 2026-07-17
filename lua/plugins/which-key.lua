return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup()

      -- Label the leader prefixes so the popup groups them clearly
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>s", group = "search" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunks / split" },
        { "<leader>d", group = "debug" },
        { "<leader>S", group = "debug step" },
        { "<leader><leader>", group = "buffers / config" },
      })
    end,
  },
}
