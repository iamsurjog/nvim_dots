return{
    'stevearc/oil.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
        })


    end,
}
