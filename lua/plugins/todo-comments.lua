return {
    "folke/todo-comments.nvim",
    lazy = false,
    keys = {
        { "<leader>tt", function() require("snacks").picker.todo_comments() end, desc = "Open TODO buffer" }
    },
    opts = {}
}
