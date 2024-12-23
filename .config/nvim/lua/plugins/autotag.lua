return {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup {
            opts = {
                enable_close = true,
                enable_rename = true, -- rename end tag when changing start tag
            },
        }
    end,
}

