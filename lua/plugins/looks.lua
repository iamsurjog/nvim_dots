return {
    -- the colorscheme should be available when starting Neovim
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = { -- Keys to be mapped to their corresponding default scrolling animation
                    "<C-u>",
                    "<C-d>",
                    "<C-b>",
                    "<C-f>",
                    "<C-y>",
                    "<C-e>",
                    "zt",
                    "zz",
                    "zb",
                },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                duration_multiplier = 1.0, -- Global duration multiplier
                easing = "linear", -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
                performance_mode = false, -- Disable "Performance Mode" on all buffers.
                ignored_events = { -- Events ignored while scrolling
                    "WinScrolled",
                    "CursorMoved",
                },
            })
        end,
    },

    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                -- table: default groups
                groups = {
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                    'EndOfBuffer',
                },
                -- table: additional groups that should be cleared
                extra_groups = {
                    "SnacksPickerNormal", "SnacksPickerBorder", "SnacksPickerTitle",
                    "SnacksPickerPrompt", "SnacksPickerSearch", "NormalFloat"
                },
                -- table: groups you don't want to clear
                exclude_groups = {},
                -- function: code to be executed after highlight groups are cleared
                -- Also the user event "TransparentClear" will be triggered
                on_clear = function() end,
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
    { "rose-pine/neovim", name = "rose-pine", priority = 1000, lazy = false }
}
