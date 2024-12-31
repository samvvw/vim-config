
function SetTreesitter()
  require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
      "vimdoc", "javascript", "typescript", "c", "lua", "rust",
      "jsdoc", "bash", "ruby", "elixir"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
    auto_install = true,


    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = { "markdown" },
    },
  })

local option = vim.opt
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.defer_fn(function()
      print("Setting foldmethod to expr")
            option.foldmethod = "expr"
            option.foldexpr = "nvim_treesitter#foldexpr()"
--            option.foldcolumn = "1"
            -- opt.foldtext = ""

 --           option.foldnestmax = 3
            option.foldlevel = 99
  --          option.foldlevelstart = 99
        end, 100)
    end,
})

 --  vim.api.nvim_create_autocmd("FileType", {
 --    pattern = { "javascript", "python", "typescript", "ruby" }, -- Add filetypes as needed
 --    callback = function()
 --        vim.defer_fn(function()
 --      print("Setting foldmethod to expr")
 --      vim.opt.foldmethod = 'expr'
 --     vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
 --      vim.opt.foldlevel = 99
 --        end, 100)
 --    end,
 --  })
  -- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  -- treesitter_parser_config.templ = {
  --   install_info = {
  --     url = "https://github.com/vrischmann/tree-sitter-templ.git",
  --     files = { "src/parser.c", "src/scanner.c" },
  --     branch = "master",
  --   },
  -- }

  -- vim.treesitter.language.register("templ", "templ")
end

SetTreesitter()
