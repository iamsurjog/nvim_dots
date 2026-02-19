vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.relativenumber = true

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('i', '<c-h>', '<c-w>')
vim.keymap.set('n', '<F8>', ':Cook<CR>')
vim.keymap.set('n', '<C-\\>', ":Hardtime toggle<CR>")
-- vim.keymap.set('n', '<F7>', ':sp | term rustc % && %< <CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
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
vim.wo.number = true

