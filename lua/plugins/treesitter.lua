-- return {
--     'nvim-treesitter/nvim-treesitter',
--     lazy = false,
--     branch = 'main',
--     build = ':TSUpdate',
--     opts = {},
--     config = function ()
--         require'nvim-treesitter'.setup {
--             -- Directory to install parsers and queries to
--             install_dir = vim.fn.stdpath('data') .. '/site'
--         }
--         vim.api.nvim_create_autocmd('FileType', {
--             pattern = { 'py' },
--             callback = function() vim.treesitter.start() end,
--         })
--     end,
-- }
return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {'OXY2DEV/markview.nvim'},
        build = ":TSUpdate",
        -- event = 'VeryLazy',
        branch = 'main',
        config = function()
            local config = require("nvim-treesitter")
            config.setup({
                ensure_installed = { "markdown", "markdown_inline", "rust", "lua", "python"},
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
