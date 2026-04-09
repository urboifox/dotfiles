vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

require("nvim-tree").setup({
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
            ".DS_Store",
        },
    },
    git = {
        ignore = false,
    },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>f.", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
