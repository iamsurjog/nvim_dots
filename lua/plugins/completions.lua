return {
    -- {
    --     "hrsh7th/cmp-nvim-lsp"
    -- },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end,
        },

        config = function()
            local ls = require("luasnip")
            vim.keymap.set({ "i", "s" }, "<A-n>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)

            vim.keymap.set({ "i", "s" }, "<A-k>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<A-j>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })


            function leave_snippet()
                if
                    ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
                    and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
                    and not require('luasnip').session.jump_active
                then
                    require('luasnip').unlink_current()
                end
            end

            -- stop snippets when you leave to normal mode
            vim.api.nvim_command([[
                autocmd ModeChanged * lua leave_snippet()
                ]])
        end,
    },
    {
        "onsails/lspkind.nvim"
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        version = "1.*",
        opts = {
            keymap = { preset = "enter" },
            appearance = {
                nerd_font_variant = "normal",
            },
            snippets = { preset = "luasnip" },
            completion = {
                documentation = {
                    window = {
                        border = "rounded",
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                    },
                    auto_show = true,
                    auto_show_delay_ms = 400,
                },
                menu = {
                    scrollbar = true,
                    border = "rounded",
                    winhighlight =
                    "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                    draw = {
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                        gap = 2,
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local icon = ctx.kind_icon
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        end
                                    else
                                        icon = require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
                                end,
                            },
                        },
                    },
                },
            },
            signature = { window = { border = "rounded" } },
            sources = {
                default = { "lsp", "snippets", "path", "buffer" },
                providers = {
                    lsp = {
                        timeout_ms = 20,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        config = function(_, opts)
            require("blink.cmp").setup(opts)
        end,
        opts_extend = { "sources.default" },
    },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-buffer",
    --     },
    --
    --     config = function()
    --
    --         local cmp = require("cmp")
    --         require("luasnip.loaders.from_vscode").lazy_load()
    --         local lspkind = require('lspkind')
    --
    --         cmp.setup({
    --             snippet = {
    --                 expand = function(args)
    --                     require("luasnip").lsp_expand(args.body)
    --                 end,
    --             },
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<C-e>"] = cmp.mapping.abort(),
    --                 ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    --             }),
    --             sources = cmp.config.sources({
    --                 { name = 'nvim_lsp' },
    --                 { name = 'luasnip' }, -- For luasnip users.
    --                 { name = 'path' },
    --                 { name = 'buffer' },
    --             }, {
    --                     { name = 'buffer' },
    --                 }),
    --             formatting = {
    --                 format = lspkind.cmp_format({
    --                     mode = 'symbol_text', -- show only symbol annotations
    --                     maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --                     -- can also be a function to dynamically calculate max width such as
    --                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
    --                     ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    --                     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
    --
    --                     -- The function below will be called before any actual modifications from lspkind
    --                     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    --                     before = function(entry, vim_item)
    --                         return vim_item
    --                     end
    --                 })
    --             }
    --
    --
    --         })
    --     end,
    -- },
}
