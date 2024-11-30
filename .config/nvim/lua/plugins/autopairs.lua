return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
        require('nvim-autopairs').setup {
            check_ts = true, -- enable treesitter
            ts_config = {
                lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
                javascript = { 'template_string' }, -- don't add pairs in javscript template_string treesitter nodes
                java = false, -- don't check treesitter on java
            },
        }
        -- If you want to automatically add `(` after selecting a function or method
        -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        -- local cmp = require 'cmp'
        -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}
