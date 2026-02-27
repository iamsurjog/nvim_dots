return{
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        "onsails/lspkind.nvim",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ensure_installed = {"prettierd"}
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            auto_install = true,
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, blink_capabilities)
            require("mason-lspconfig").setup({
                ensure_installed = {"eslint", "lua_ls", "pyright", "clangd",
                "html", "cssls", "ts_ls", "tailwindcss", "markdown_oxide" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = lsp_capabilities,
                        }) --automatically setup the lsp servers!!!
                    end,
                },

            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- vim.diagnostic.config({virtual_text = true})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover()
                    end, opts)
                    vim.keymap.set("n", "gd", function()
                        vim.lsp.buf.definition()
                    end, opts)
                    vim.keymap.set("n", "gD", function()
                        vim.lsp.buf.declaration()
                    end, opts)
                    vim.keymap.set("n", "gi", function()
                        vim.lsp.buf.implementation()
                    end, opts)
                    vim.keymap.set("n", "go", function()
                        vim.lsp.buf.type_definition()
                    end, opts)
                    vim.keymap.set("n", "gr", function()
                        vim.lsp.buf.references()
                    end, opts)
                    vim.keymap.set("n", "gs", function()
                        vim.lsp.buf.signature_help()
                    end, opts)
                    vim.keymap.set("n", "<F2>", function()
                        vim.lsp.buf.rename()
                    end, { desc = "Rename" })
                    vim.keymap.set("n", "<F4>", function()
                        vim.lsp.buf.code_action()
                    end, opts)
                end,
            })
        end,
    },

    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                        -- 'super-tab' for mappings similar to vscode (tab to accept)
                        -- 'enter' for enter to accept
                        -- 'none' for no mappings
                        --
                        -- All presets have the following mappings:
                        -- C-space: Open menu or open docs if already open
                        -- C-n/C-p or Up/Down: Select next/previous item
                        -- C-e: Hide menu
                        -- C-k: Toggle signature help (if signature.enabled = true)
                        --
                        -- See :h blink-cmp-config-keymap for defining your own keymap
                        keymap = { preset = 'super-tab' },


                        -- (Default) Only show the documentation popup when manually triggered
                        completion = { 
                            documentation = { auto_show = false },
                            menu = {
                                draw = {
                                    components = {
                                        kind_icon = {
                                            text = function(ctx)
                                                return require('lspkind').symbol_map[ctx.kind] or ''
                                            end,
                                        },
                                    },
                                },
                            },
                        },

                        -- Default list of enabled providers defined so that you can extend it
                        -- elsewhere in your config, without redefining it, due to `opts_extend`
                        sources = {
                            default = { 'lsp', 'path', 'snippets', 'buffer' },
                        },

                        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
                        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
                        --
                        -- See the fuzzy documentation for more information
                        fuzzy = { implementation = "prefer_rust_with_warning" }
                    },
                    opts_extend = { "sources.default" }
                }
            }
