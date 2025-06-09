return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*', -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
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
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },

        signature = {
            enabled = true,
            trigger = {
                show_on_trigger_character = false,
                show_on_insert = false,
                show_on_accept = false,
                show_on_insert_on_trigger_character = false,
                show_on_accept_on_trigger_character = false,
                show_on_keyword = false,
                blocked_trigger_characters = { '(', ')', ',' },
            },
            window = {
                border = 'rounded',
            },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            documentation = {
                auto_show = true,
                window = {
                    border = 'rounded',
                },
            },
            menu = {
                border = 'rounded',
                auto_show = true,
                min_width = 34,
                max_height = 60,
                draw = {
                    treesitter = { 'lsp' },
                    padding = 2,
                    gap = 2,
                    columns = { { 'kind_icon', 'label', 'label_description', gap = 1 }, { 'kind' } },
                    components = {
                        label_description = {
                            text = function(ctx)
                                return ctx.item.labelDetails and ctx.item.labelDetails.description or ctx.item.detail or ''
                            end,
                            highlight = 'BlinkCmpLabelDescription',
                        },
                    },
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lsp = {
                    name = 'lsp',
                    enabled = true,
                    module = 'blink.cmp.sources.lsp',
                    kind = 'LSP',
                    score_offset = 1000, -- the higher the number, the higher the priority
                    opts = { tailwind_color_icon = 'π' },
                },
                snippets = {
                    name = 'snippets',
                    enabled = true,
                    module = 'blink.cmp.sources.snippets',
                    score_offset = 900, -- the higher the number, the higher the priority
                },
                buffer = {
                    name = 'Buffer',
                    enabled = true,
                    max_items = 3,
                    module = 'blink.cmp.sources.buffer',
                    min_keyword_length = 2,
                    score_offset = 15, -- the higher the number, the higher the priority
                },
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        -- fuzzy = {
        --     implementation = 'prefer_rust_with_warning',
        -- },
    },
    -- opts_extend = { 'sources.default' },
    config = function(_, opts)
        local blink = require 'blink-cmp'
        blink.setup(opts)

        vim.keymap.set({ 'i', 'n' }, '<C-s>', function()
            if blink.is_signature_visible() then
                blink.hide_signature()
            else
                blink.show_signature()
            end
        end, { desc = 'Show signature help' })

        vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { fg = '#6e6a86', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'BlinkCmpDocSeparator', { bg = 'NONE', fg = '#6e6a86' })
        vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { fg = '#6e6a86', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#6e6a86', bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { fg = '#191724', bg = '#e0def4', bold = true })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { fg = '#cecacd' })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { fg = '#6e6a86' })
    end,
}
