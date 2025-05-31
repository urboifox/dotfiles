return {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    -- optionally, override the default options:
    config = function()
        require('tailwindcss-colorizer-cmp').setup {
            color_square_width = 2,
        }
        require('cmp').setup {
            formatting = {
                format = require('tailwindcss-colorizer-cmp').formatter,
            },
        }
    end,
}
