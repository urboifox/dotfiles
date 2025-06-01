return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        preset = 'none', -- Avoids default styles that may include backgrounds
        file_types = { 'markdown' },
        render_modes = { 'n', 'c', 't' },
        code = {
            disable_background = true,
            highlight_border = false,
            style = 'language',
        },
        heading = {
            backgrounds = { 'NONE' },
        },
        inline_code = {
            hl_group = 'NONE',
        },
    },
    ft = 'markdown',
    config = function(_, opts)
        require('render-markdown').setup(opts)
    end,
}
