-- Toggle between rose-pine light (dawn) and dark (main).
-- Exposed globally so it can be called from a keymap (<leader><leader>cs).
function ChangeTheme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
    vim.cmd.colorscheme("rose-pine-dawn")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("rose-pine-main")
  end
end

return {
  -- Extra colorschemes kept as switchable options
  { "morhetz/gruvbox", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },

  -- Active colorscheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({})
      -- Start in dark mode. Flip vim.o.background first so ChangeTheme lands on dark.
      vim.o.background = "light"
      ChangeTheme()
    end,
  },
}
