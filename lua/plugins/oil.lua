return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local devicons = require("nvim-web-devicons")
        -- Override or add an icon for .l file extension
        devicons.set_icon {
            y = {
                icon = "🤮",
                name = "VomitingIcon"
            },
            l = {
                icon = "😠",
                name = "AngryIcon"
            }
        }

        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
            -- do not override columns here to keep default icons intact, they use nvim-web-devicons
        })
    end,
}

