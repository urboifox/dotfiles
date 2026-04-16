vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ["<C-f>"] = "actions.close",
        ["gr"] = {
            callback = function()
                require("oil").open(vim.fn.getcwd())
            end,
            desc = "Jump to project root",
        },
        ["<C-l>"] = false,
        ["<C-h>"] = false,
    },
    view_options = {
        show_hidden = true,
    },
    float = {
        padding = 2,
        max_width = 80,
        max_height = 20,
        border = "rounded",
    },
})

vim.keymap.set("n", "<C-f>", "<cmd>Oil<CR>", { desc = "Open explorer in float window" })
vim.keymap.set("n", "<leader>f.", "<cmd>Oil<CR>", { desc = "Open current directory in explorer" })
