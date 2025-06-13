return {
    'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
    init = function()
        local lackluster = require 'lackluster'
        lackluster.setup {
            tweak_syntax = {
                comment = lackluster.color.gray5,
                string = lackluster.color.orange,
            },
            tweak_background = {
                normal = 'none',
                telescope = 'none',
                menu = 'none',
                popup = 'default',
            },
        }
        -- vim.cmd.colorscheme 'lackluster'
        -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
        -- vim.cmd.colorscheme("lackluster-mint")
    end,
}
