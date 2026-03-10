vim.cmd.colorscheme("rose-pine-main")

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>ff', ":lua Snacks.picker('files')<CR>", { desc = "Find File" })
vim.keymap.set('n', '<leader>fg', ":lua Snacks.picker('live_grep')<CR>", { desc = "Find Text" })
vim.keymap.set('n', '<leader><leader>', ":lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Recent Files" })

vim.keymap.set('n', '<C-\\>', ":Hardtime toggle<CR>", { desc = "Toggle Hardtime" })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Remove Highlight" })
vim.keymap.set("n", "<C-F1>", ":lua Snacks.dashboard()<CR>", { desc = "Open Dashboard" })
vim.keymap.set("n", "<C-s>", ":wa<CR>", { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<ESC>:wa<CR>a", { desc = "Save" })
vim.keymap.set("i", "<C-z>", "<ESC>ua", { desc = "Undo" })
vim.keymap.set("n", "<C-z>", "", { desc = "Disable Suspend" })
vim.keymap.set("n", "ZZ", "", { desc = "No exit" })
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", { desc = "Copy into clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", "\"+d", { desc = "Delete into clipboard" })

vim.keymap.set("i", "'", "'", {buffer=0})
vim.keymap.set("i", "\"", "\"", {buffer=0})
vim.keymap.set("i", "`", "`", {buffer=0})
vim.keymap.set("n", "<leader>ca", function() require("tiny-code-action").code_action() end, { noremap = true, silent = true, desc = "Code Actions"})

