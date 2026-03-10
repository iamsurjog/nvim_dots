return{
    'tamton-aquib/staline.nvim',
    config = function()
        require("staline").setup {
            sections = {
                left = {
                    'line_column',                        -- Filesize
                    'lsp',
                },
                mid = { 'mode',                      -- "lsp_name" is still a little buggy
                'file_name'
                },
                right = {
                    'lsp_name',
                    'branch'
                }
            },
            defaults = {
                bg = "#202328",
                branch_symbol = " "
            },
            -- TODO: Add colors
            mode_colors = {
                n = "#c4a7e7",
                i = "#ea9a97",       -- etc mode
                v = "#f6c177",
                c = "#eb6f92"
            }
        }
    end
}

