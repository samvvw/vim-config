print("lsp config loaded...")

local lsp = require('lsp-zero').preset({
  float_border = 'rounded',
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

lsp.on_attach(function(client, bufnr)
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		update_in_insert = false,
		virtual_text = { spacing = 4, prefix = "🚧" },
		severity_sort = true,
	}
)
-- Diagnostics settings

vim.diagnostic.config({
virtual_text = {
		prefix = "🔔"
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})

lsp.setup()

-- local signs = { Error = "⛔", Warn = "⚠️", Hint = "💡", Info = "ℹ️ " }
-- 
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
