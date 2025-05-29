return {
    'leath-dub/snipe.nvim',
    keys = {
        {
            '<leader>b',
            function()
                require('snipe').open_buffer_menu()
            end,
            desc = 'Open Snipe buffer menu',
        },
    },
    opts = {
        ui = {
            open_win_override = {
                title = 'Buffer Menu',
                border = 'rounded', -- use "rounded" for rounded border
            },
        },
        hints = {
            -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
            ---@type string
            -- dictionary = 'sadflewcmpghio',
            dictionary = '1234567890',
        },
        navigate = {
            cancel_snipe = { '<esc>', 'q' },
        },
    },
}
