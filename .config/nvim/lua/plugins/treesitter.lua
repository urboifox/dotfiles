return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        auto_install = true,
        ensure_installed = {
            'lua',
            'http',
            'svelte',
            'html',
            'css',
            'javascript',
            'typescript'
        },
        highlight = {
            enable = true,
        },
        indent = { enable = true, disable = { 'ruby' } },
    },
}
