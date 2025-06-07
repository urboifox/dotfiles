return {
    'mistweaverco/kulala.nvim',
    branch = 'develop',
    ft = { 'http', 'rest' },
    config = function()
        local kulala = require 'kulala'
        kulala.setup {
            global_keymaps = true,
            lsp = {
                formatter = true,
            },
            ui = {
                display_mode = 'split', -- 'split', 'float'
            },
        }

        vim.keymap.set({ 'n', 'v' }, '<leader>rs', kulala.run, { desc = 'Run request' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ra', kulala.run_all, { desc = 'Run all requests' })
    end,
}
