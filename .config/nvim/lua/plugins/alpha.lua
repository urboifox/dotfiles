return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        local alpha = require 'alpha'
        local theme = require 'alpha.themes.startify'

        alpha.setup(theme.config)
    end,
}
