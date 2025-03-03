return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load {
            transparent = {
                bg = true,
                float = true,
            },
            cursorline = {
                blend = 1,
            },
            bold_keywords = true,
            italic_comments = true,
        }
    end,
}
