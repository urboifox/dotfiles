vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({
    focus = true,
})

vim.keymap.set(
    "n",
    "<leader>xw",
    "<cmd>Trouble diagnostics toggle<CR>",
    { desc = "Open trouble workspace diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
