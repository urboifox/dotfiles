return {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local nvimtree = require 'nvim-tree'

        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup {
            view = {
                width = 40,
                relativenumber = true,
                -- side = 'right',
            },
            renderer = {
                indent_markers = {
                    enable = false,
                },
            },
            actions = {
                open_file = {
                    quit_on_open = true,

                    -- disable window_picker for
                    -- explorer to work well with
                    -- window splits
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = {
                    '.DS_Store',
                },
            },
            git = {
                ignore = false,
            },
        }

        -- highlight selected file cursor line
        --[[ vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', {
            bg = '#e0def4',
            fg = '#191724',
        }) ]]

        -- set keymaps
        local keymap = vim.keymap

        keymap.set('n', '<C-f>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
        keymap.set('n', '<leader>f.', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' }) -- toggle file explorer on current file
    end,
}
