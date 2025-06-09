return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    'node_modules',
                    '.DS_Store',
                    '.git',
                    'target',
                    'vendor',
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search keymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search files' })
        vim.keymap.set('n', '<leader>fb', builtin.builtin, { desc = 'Search Telescope builtins' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search current word' })
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Search for string in files' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search diagnostics' })
        vim.keymap.set('n', '<leader>fc', builtin.resume, { desc = 'Search rontinue' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Search Recent Files' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 0,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>f/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = 'Search in Open Files' })

        vim.keymap.set('n', '<leader>fn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = 'Search Neovim files' })
    end,
}
