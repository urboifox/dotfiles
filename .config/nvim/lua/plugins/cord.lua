return {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    config = function()
        require('cord').setup {
            display = {
                theme = 'atom',
            },
            idle = {
                enabled = false,
            },
            editor = {
                tooltip = 'The one true text editor',
            },
        }
    end,
}
