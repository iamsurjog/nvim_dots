return {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = true, -- This plugin is already lazy
    event = 'VeryLazy',
    config = function()
        require("rustaceanvim")
        -- vim.keymap.set( "n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, { silent = true, buffer = bufnr })
        vim.keymap.set( "n", "K",  function() vim.cmd.RustLsp({'hover', 'actions'}) end, { silent = true, buffer = bufnr })
    end,
}
