# Sam's Neovim config

A portable Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).
Clone it, launch `nvim`, and lazy.nvim bootstraps itself and installs everything on
first run — no manual plugin-manager setup required.

## Requirements

- Neovim **0.11+** (uses the native `vim.lsp.config` API)
- `git`
- A C compiler and the [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
  on your `PATH` — nvim-treesitter's `main` branch compiles parsers from source
  (`npm install -g tree-sitter-cli`, or `cargo install tree-sitter-cli`)
- A [Nerd Font](https://www.nerdfonts.com/) (for file icons / statusline glyphs)
- Optional, for specific features:
  - `node` + `npm` — prettier, many LSP servers
  - Formatters/debug adapters (`stylua`, `prettier`, `codelldb`, …) are installed
    on demand via [Mason](https://github.com/williamboman/mason.nvim) (`:Mason`)

## Install

```sh
git clone <this-repo> ~/.config/nvim
nvim
```

On first launch lazy.nvim installs all plugins and treesitter parsers. When it
finishes, quit and reopen Neovim. Run `:Lazy` any time to manage plugins and
`:Mason` to manage LSP servers.

## Layout

```
init.lua                 -- entry point
lua/config/
  options.lua            -- vim options
  keymaps.lua            -- key mappings
  autocmds.lua           -- autocommands
  lazy.lua               -- plugin-manager bootstrap
lua/plugins/             -- one spec file per concern (lsp, telescope, git, …)
```

## Key bindings

Leader is `<Space>`. Press it and pause to see available mappings via
[which-key](https://github.com/folke/which-key.nvim).

| Mapping            | Action                          |
| ------------------ | ------------------------------- |
| `<leader>ff`       | Find files (Telescope)          |
| `<leader>fg`       | Live grep with args             |
| `<leader>fb`       | Buffers                         |
| `<leader>ps`       | Grep for a prompt               |
| `<leader>gs`       | Git status (fugitive)           |
| `<leader>==`       | Toggle undotree                 |
| `<leader>p`        | Format buffer/selection (conform) |
| `<leader>vs` / `hs`| Vertical / horizontal split     |
| `<leader>vt` / `ht`| Vertical / horizontal terminal  |
| `<leader><leader>cs` | Toggle light/dark colorscheme |
| `jj` (insert)      | Escape                          |

LSP mappings (buffer-local, active once a server attaches): `K` hover, `gd`
definition, `gD` declaration, `gi` implementation, `go` type definition, `gr`
references, `gs` signature help, `gl` line diagnostics, `<F2>` rename, `<F3>`
format, `<F4>` code action. Completion (nvim-cmp): `<C-Space>` trigger, `<CR>`
confirm, `<C-e>` abort, `<C-b>`/`<C-f>` scroll docs.

Git hunks (gitsigns): `]h` / `[h` next/prev, `<leader>hp` preview, `<leader>hr`
reset, `<leader>hb` blame line.

Debugging (nvim-dap): `<leader>dr` continue/start, `<leader>ds` terminate,
`<leader>dq` restart, `<leader>dc` run to cursor, `<leader>SO`/`SI`/`SQ` step
over/into/out, `<leader>do` toggle breakpoint, `<leader>dO` conditional
breakpoint, `<leader>dF` log point, `<leader>dp` evaluate under cursor,
`<leader>du` toggle the debug UI.

## LSP servers

Servers are installed on demand through [Mason](https://github.com/williamboman/mason.nvim)
(`:Mason`). Commonly used here:

- `lua_ls`
- `ts_ls` (TypeScript/JavaScript)
- `eslint`
- `cssls`, `cssmodules_ls`
- `html`, `jsonls`, `emmet_ls`
- `rust_analyzer`
- `gopls`
- `elixirls`
- `solargraph` (Ruby)
- `hls` (Haskell)

## Notes

- `lazy-lock.json` is committed so plugin versions stay reproducible across machines.
  Run `:Lazy update` to bump them.
- The LSP layer uses Neovim's native `vim.lsp.config` / `vim.lsp.enable`, with
  [mason](https://github.com/williamboman/mason.nvim) +
  [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) for
  installing servers and [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  for their default configs.
- nvim-treesitter tracks the `main` branch. Manage parsers with `:TSInstall`,
  and run `:checkhealth nvim-treesitter` if highlighting looks off.
- Formatting is handled by [conform.nvim](https://github.com/stevearc/conform.nvim)
  with format-on-save. Formatters (`stylua`, `prettier`) come from Mason; if one
  isn't installed conform falls back to LSP formatting.
- Debugging uses [nvim-dap](https://github.com/mfussenegger/nvim-dap) +
  [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui); adapters (e.g. `codelldb`
  for Rust/C/C++) are installed via Mason.
