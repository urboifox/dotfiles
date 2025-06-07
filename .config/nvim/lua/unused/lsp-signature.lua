return {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    config = function()
        local lspSig = require 'lsp_signature'

        lspSig.setup {
            always_trigger = false,
        }

        vim.keymap.set({ 'i', 'n' }, '<C-k>', function()
            lspSig.toggle_float_win()
        end, { desc = 'toggle signature' })
    end,
}
