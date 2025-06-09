return { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
    },
    config = function()
        local cmp = require 'cmp'

        vim.keymap.set('n', '<C-Space>', function()
            -- Move to end of current word, enter insert mode, and trigger cmp
            local keys = vim.api.nvim_replace_termcodes('ea', true, false, true)
            vim.api.nvim_feedkeys(keys, 'n', false)
        end, { desc = 'Jump to end of word and trigger completion' })

        cmp.setup {
            formatting = {
                format = require('lspkind').cmp_format {
                    before = require('tailwind-tools.cmp').lspkind_format,
                },
            },
            window = {
                completion = { border = 'rounded' },
                documentation = { border = 'rounded' },
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
                ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
                ['<CR>'] = cmp.mapping.confirm { select = false }, -- Accept the completion
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete { config = {} },
            },
            sources = {
                { name = 'lazydev', group_index = 0 },
                {
                    name = 'nvim_lsp',
                    entry_filter = function(entry)
                        return require('cmp').lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                    end,
                },
                -- { name = 'luasnip' },
                { name = 'path' },
            },
        }
    end,
}
