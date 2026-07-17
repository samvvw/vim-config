return {
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },
  { "airblade/vim-gitgutter", event = { "BufReadPre", "BufNewFile" } },
  { "f-person/git-blame.nvim", event = "VeryLazy" },
}
