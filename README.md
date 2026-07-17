# Sam's Neovim config

A portable Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).
Clone it, launch `nvim`, and lazy.nvim bootstraps itself and installs everything on
first run — no manual plugin-manager setup required.

## Requirements

- Neovim **0.10+**
- `git`
- A [Nerd Font](https://www.nerdfonts.com/) (for file icons / statusline glyphs)
- Optional, for specific features:
  - `node` + `npm` — Prettier, Copilot, many LSP servers
  - `python3` — vimspector debug adapters
  - A C compiler — treesitter parser builds

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

Leader is `<Space>`.

| Mapping            | Action                          |
| ------------------ | ------------------------------- |
| `<leader>ff`       | Find files (Telescope)          |
| `<leader>fg`       | Live grep with args             |
| `<leader>fb`       | Buffers                         |
| `<leader>ps`       | Grep for a prompt               |
| `<leader>gs`       | Git status (fugitive)           |
| `<leader>==`       | Toggle undotree                 |
| `<leader>p`        | Prettier                        |
| `<leader>vs` / `hs`| Vertical / horizontal split     |
| `<leader>vt` / `ht`| Vertical / horizontal terminal  |
| `<leader><leader>cs` | Toggle light/dark colorscheme |
| `jj` (insert)      | Escape                          |

LSP, completion, and vimspector debug mappings follow lsp-zero / vimspector defaults.

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
- nvim-treesitter is pinned to the `master` branch (classic config API). The `main`
  branch is a rewrite with a different API and is not used here.
