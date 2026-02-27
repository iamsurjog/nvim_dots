return{
    'tamton-aquib/staline.nvim',
    event = "VeryLazy",
    config = function()
        require("staline").setup {
            sections = {
                left = {
                    'line_column',                        -- Filesize
                },
                mid = { 'mode',                      -- "lsp_name" is still a little buggy
                'file_name'
                },
                right = {
                    '  ',
                    'branch'
                }
            },
            defaults = {
                bg = "#202328",
                branch_symbol = " "
            },
            -- TODO: Add colors
            mode_colors = {
                n = "#38b1f0",
                i = "#9ece6a",       -- etc mode
            }
        }
    end
}

