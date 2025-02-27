return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            require('rose-pine').setup {
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
                variant = 'main',
                dark_variant = 'main',

                enable = {
                    terminal = true,
                    legacy_highlights = true,
                    migrations = true,
                },

                -- highlight_groups = {
                --     CursorLine = { bg = '#14111C' },
                -- },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            }
            vim.cmd 'colorscheme rose-pine'
        end,
    },
}
