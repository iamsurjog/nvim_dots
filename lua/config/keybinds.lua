vim.cmd.colorscheme("rose-pine-main")
vim.cmd.TransparentEnable()

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>ff', ":lua Snacks.dashboard.pick('files')<CR>", { desc = "Find File" })
vim.keymap.set('n', '<leader>fg', ":lua Snacks.dashboard.pick('live_grep')<CR>", { desc = "Find Text" })
vim.keymap.set('n', '<leader><leader>', ":lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Recent Files" })

vim.keymap.set('n', '<C-\\>', ":Hardtime toggle<CR>")
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<C-F1>", ":lua Snacks.dashboard()<CR>")
vim.keymap.set("n", "<C-s>", ":wa<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:wa<CR>a")
vim.keymap.set("i", "<C-z>", "<ESC>ua")
vim.keymap.set("n", "<C-z>", "")
vim.keymap.set("n", "ZZ", "")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>d", "\"+d")

vim.keymap.set("i", "'", "'", {buffer=0})
vim.keymap.set("i", "\"", "\"", {buffer=0})
vim.keymap.set("i", "`", "`", {buffer=0})
vim.keymap.set("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

