return {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
        config = function()
            local devicons = require 'nvim-web-devicons'
            require('nvim-web-devicons').setup {
                -- color_icons = false,
            }
        end,
    },
}
