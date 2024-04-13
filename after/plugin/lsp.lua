local lsp = require('lsp-zero').preset({
  call_servers = 'local',
  configure_diagnostics = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = {},
  },
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = true,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
    error = '⛔',
    warn = '⚠️',
    hint = '💡',
    info = 'ℹ️'
  })

-- Diagnostics settings
vim.o.updatetime = 250

vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
virtual_text = {
		prefix = "🚧"
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})

lsp.setup()
