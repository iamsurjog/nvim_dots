return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
        defaults = {
            preview = {
                treesitter = false,
            },
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
        },

        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Find Files"})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Live Grep"})
        vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {desc = "Old files"})
        vim.keymap.set("v", "<leader>ps", "y<ESC>:lua require('telescope.builtin').grep_string({ default_text = vim.fn.getreg('\"')})<CR>")
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definitions" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
