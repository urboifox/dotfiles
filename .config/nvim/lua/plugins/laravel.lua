return {
    {
        'jwalton512/vim-blade',
        ft = { 'blade' },
    },

    {
        'adalessa/laravel.nvim',
        dependencies = {
            'tpope/vim-dotenv',
            'nvim-telescope/telescope.nvim',
            'MunifTanjim/nui.nvim',
            'kevinhwang91/promise-async',
        },
        cmd = { 'Laravel' },
        event = { 'VeryLazy' },
        opts = {},
        config = true,
    },
}
