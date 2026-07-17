return {
  -- File icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
        },
        color_icons = true,
        default = true,
        strict = true,
        override_by_filename = {
          [".gitignore"] = { icon = "", color = "#f1502f", name = "Gitignore" },
        },
        override_by_extension = {
          ["log"] = { icon = "", color = "#81e043", name = "Log" },
        },
        override_by_operating_system = {
          ["apple"] = { icon = "", color = "#A2AAAD", cterm_color = "248", name = "Apple" },
        },
      })
    end,
  },

  -- Status line + buffer tabline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- follows the active colorscheme (rose-pine)
          globalstatus = true,
        },
        tabline = {
          lualine_a = { "buffers" },
          lualine_z = { "tabs" },
        },
      })
    end,
  },
}
