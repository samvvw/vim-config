vim.g.mapleader = " "

-- Switch buffers
vim.keymap.set("n", "<leader><TAB>", ":bn<CR>")
vim.keymap.set("n", "<leader><s-TAB>", ":bp<CR>")

-- Netrw / save / close buffers
vim.keymap.set("n", "<leader>nt", ":Ex<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":Ex<CR>")
vim.keymap.set("n", "<leader>Q", ":bd<CR>")
vim.keymap.set("n", "<leader>W", ":%bd|e#<CR>")

-- Escape insert mode
vim.keymap.set("i", "jj", "<ESC>")

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1'<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2'<CR>gv=gv")
-- Join line keeping cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered when jumping through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "#", "#zzzv")

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')

-- Paste from system clipboard
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>P", '"+p')

-- Telescope (lazily require so it only loads on first use)
vim.keymap.set(
  "n",
  "<leader>ps",
  function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end
)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>sh", function() require("telescope.builtin").help_tags() end, { desc = "[S]earch [H]elp" })
vim.keymap.set(
  "n",
  "<leader>sk",
  function() require("telescope.builtin").keymaps() end,
  { desc = "[S]earch [K]eymaps" }
)
vim.keymap.set(
  "n",
  "<leader>sd",
  function() require("telescope.builtin").diagnostics() end,
  { desc = "[S]earch [D]iagnostics" }
)
vim.keymap.set("n", "<leader>sr", function() require("telescope.builtin").resume() end, { desc = "[S]earch [R]esume" })
vim.keymap.set(
  "n",
  "<leader><leader><leader>",
  function() require("telescope.builtin").buffers() end,
  { desc = "[ ] Find existing buffers" }
)
vim.keymap.set(
  "n",
  "<leader>s/",
  function()
    require("telescope.builtin").live_grep({
      grep_open_files = true,
      prompt_title = "Live Grep in Open Files",
    })
  end,
  { desc = "[S]earch [/] in Open Files" }
)

-- Git (vim-fugitive)
vim.keymap.set("n", "<leader>gs", ":Git<CR>")

-- Undotree
vim.keymap.set("n", "<leader>==", ":UndotreeToggle<CR>")

-- Window management
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")
vim.keymap.set("n", "<leader>hs", ":split<CR>")

-- Formatting (<leader>p) and debugging (<leader>d*, <leader>S*) keymaps live in
-- their plugin specs: lua/plugins/editor.lua (conform) and lua/plugins/debug.lua (dap).

-- Toggle colorscheme light/dark
vim.keymap.set("n", "<leader><leader>cs", function() ChangeTheme() end)

-- Terminal mode
vim.keymap.set("t", "<C-w>n", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>vt", ":vsplit <CR>:term <CR>", { desc = "Open vertical terminal" })
vim.keymap.set("n", "<leader>ht", ":split <CR>:term <CR>", { desc = "Open horizontal terminal" })
