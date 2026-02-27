return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            options = {
                multilines = {
                    enabled = true,
                },
                add_messages = {
                    display_count = true,
                },
                show_source = {
                    enabled = true,
                },
            },
        })
    end,
}

