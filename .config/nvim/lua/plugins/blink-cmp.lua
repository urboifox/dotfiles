return {
    'saghen/blink.cmp',

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

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
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = {
                    border = 'rounded',
                },
            },
            menu = {
                max_height = 15,
                border = 'rounded',
                auto_show = true,
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
        },

        sources = {
            providers = {
                lsp = {
                    opts = { tailwind_color_icon = '◼' },
                },
            },
        },
    },
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
        vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = '#191724' })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { fg = '#cecacd' })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { fg = '#6e6a86' })
    end,
}
