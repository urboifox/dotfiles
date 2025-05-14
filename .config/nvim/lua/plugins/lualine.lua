return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        vim.opt.showmode = false
        local lualine = require 'lualine'

        -- configure lualine with modified theme
        lualine.setup {
            options = {
                theme = 'auto',

                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },

                icons_enabled = true,
                icon = '',

                -- all colors transparent
                disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = { 'branch' },
                    lualine_c = { 'location' },
                    lualine_x = { 'diagnostics' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'filetype' },
                },
            },
        }
    end,
}
