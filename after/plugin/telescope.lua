require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      "deps",
      "_build",
      ".elixir_ls"
    }
  }
}
