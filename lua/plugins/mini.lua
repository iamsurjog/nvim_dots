return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
        require("mini.surround").setup()
        require("mini.ai").setup()
        require("mini.pairs").setup()
        require("mini.comment").setup()
        require("mini.move").setup()

    end
}
