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

  -- Status / tab line
  {
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" },
    config = function()
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g.airline_powerline_fonts = 1
    end,
  },
}
