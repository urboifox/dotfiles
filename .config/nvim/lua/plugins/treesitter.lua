return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        auto_install = true,
        ensure_installed = {
            'lua',
            'http',
        },
        highlight = {
            enable = true,
        },
        indent = { enable = true, disable = { 'ruby' } },
    },
}
