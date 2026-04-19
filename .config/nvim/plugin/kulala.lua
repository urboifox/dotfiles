vim.filetype.add({
    extension = {
        ["http"] = "http",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "http",
    callback = function()
        vim.pack.add({ "https://github.com/mistweaverco/kulala.nvim" })
        require("kulala").setup({
            global_keymaps = true,
            lsp = { formatter = true },
            ui = { display_mode = "split" },
        })
        vim.treesitter.start()
    end,
})
