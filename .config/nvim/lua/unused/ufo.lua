return {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
        ---@type Ufo
        local ufo = require 'ufo'
        ufo.setup()

        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    end,
}
