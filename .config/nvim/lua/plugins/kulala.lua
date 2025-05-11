return {
    'mistweaverco/kulala.nvim',
    ft = { 'http', 'rest' },
    config = function()
        local kulala = require 'kulala'
        kulala.setup {
            global_keymaps = true,
            ui = {
                display_mode = 'float',
            },
        }

        vim.keymap.set({ 'n', 'v' }, '<leader>rs', kulala.run, { desc = 'Run request' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ra', kulala.run_all, { desc = 'Run all requests' })
    end,
}
