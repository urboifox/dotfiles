vim.pack.add({
    {
        src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
        version = vim.version.range("3"),
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
    filesystem = {
        window = {
            mappings = {
                ["w"] = "none", -- disables word-forward behavior in tree
                ["<C-f>"] = "none",
            },
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
})

vim.keymap.set("n", "<C-f>", "<cmd>Neotree toggle<CR>", { desc = "Toggle explorer" })
vim.keymap.set("n", "<leader>f.", "<cmd>Neotree reveal<CR>", { desc = "Reveal current file in explorer" })
