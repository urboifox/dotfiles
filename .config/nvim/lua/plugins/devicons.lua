return {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
        config = function()
            require('nvim-web-devicons').setup {
                -- color_icons = false,
            }
        end,
    },
}
