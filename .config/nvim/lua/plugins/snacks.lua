---@module "snacks"

return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = 'header' },
                { section = 'keys', gap = 1, padding = 1 },
                { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 1, 1 } },
                { section = 'startup' },
            },
        },
        explorer = {
            enabled = false,
            replace_netrw = true,
        },
        toggle = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = {
            enabled = false,
            layout = {
                reverse = true,
            },
        },
        quickfile = { enabled = true },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        -- explorer
        {
            '<leader>e',
            function()
                Snacks.explorer.open()
            end,
            desc = 'File Explorer',
        },
        {
            '<leader>f.',
            function()
                Snacks.explorer.reveal()
            end,
            desc = 'Reveal Current File',
        },
        {
            '<leader>lg',
            function()
                Snacks.lazygit()
            end,
            desc = 'LazyGit',
        },
        -- find
        {
            '<leader>fb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>fn',
            function()
                Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
            end,
            desc = 'Find Config File',
        },
        {
            '<leader>ff',
            function()
                Snacks.picker.files()
            end,
            desc = 'Find Files',
        },
        {
            '<leader>fs',
            function()
                Snacks.picker.grep()
            end,
            desc = 'Grep',
        },
        {
            '<leader>fg',
            function()
                Snacks.picker.git_files()
            end,
            desc = 'Find Git Files',
        },
        {
            '<leader>fp',
            function()
                Snacks.picker.projects()
            end,
            desc = 'Projects',
        },
        {
            '<leader>fr',
            function()
                Snacks.picker.recent()
            end,
            desc = 'Recent',
        },
        {
            '<leader>fC',
            function()
                Snacks.picker.colorschemes()
            end,
            desc = 'Colorschemes',
        },
        -- buffer
        {
            '<leader>bdd',
            function()
                Snacks.bufdelete()
            end,
            desc = 'Delete Buffer',
        },
        {
            '<leader>bda',
            function()
                Snacks.bufdelete.all()
            end,
            desc = 'Delete All Buffers',
        },
        {
            '<leader>bdo',
            function()
                Snacks.bufdelete.other()
            end,
            desc = 'Delete Other Buffers',
        },
        -- LSP
        {
            'gd',
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = 'Goto Definition',
        },
        {
            'gD',
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = 'Goto Declaration',
        },
        {
            'gr',
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = 'References',
        },
        {
            'gI',
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = 'Goto Implementation',
        },
        {
            'gy',
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = 'Goto T[y]pe Definition',
        },
        {
            '<leader>rn',
            function()
                vim.lsp.buf.rename()
            end,
            desc = 'LSP Rename',
        },
        {
            '<leader>ss',
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = 'LSP Symbols',
        },
        {
            '<leader>sS',
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = 'LSP Workspace Symbols',
        },
        -- other
        {
            '<leader>z',
            function()
                Snacks.zen()
            end,
            desc = 'Toggle Zen Mode',
        },
        {
            '<leader>nn',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Dismiss All Notifications',
        },
    },
    config = function(_, opts)
        require('snacks').setup(opts)

        -- LSP-integrated rename files
        local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
        vim.api.nvim_create_autocmd('User', {
            pattern = 'NvimTreeSetup',
            callback = function()
                local events = require('nvim-tree.api').events
                events.subscribe(events.Event.NodeRenamed, function(data)
                    if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
                        data = data
                        Snacks.rename.on_rename_file(data.old_name, data.new_name)
                    end
                end)
            end,
        })
    end,
}
