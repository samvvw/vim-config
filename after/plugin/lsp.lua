print("lsp config loaded...")
local lsp = require('lsp-zero').preset("recommended")
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Fix Undefined global 'vim'

-- (Optional) Configure lua language server for neovim


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

local signs = { Error = "⛔", Warn = "⚠️", Hint = "💡", Info = "ℹ️ " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
