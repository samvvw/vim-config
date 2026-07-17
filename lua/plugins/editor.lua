return {
  -- Surround / auto-close pairs
  { "tpope/vim-surround", event = "VeryLazy" },
  { "jiangmiao/auto-pairs", event = "InsertEnter" },

  -- Indentation guides
  { "yggdroot/indentline", event = { "BufReadPost", "BufNewFile" } },

  -- Inline CSS color previews
  { "ap/vim-css-color", ft = { "css", "scss", "html", "javascript", "typescript" } },

  -- Undo history visualizer
  { "mbbill/undotree", cmd = "UndotreeToggle" },

  -- Prettier formatter
  {
    "prettier/vim-prettier",
    build = "npm install",
    cmd = "Prettier",
  },
}
