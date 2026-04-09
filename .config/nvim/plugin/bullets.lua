vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.pack.add({ "https://github.com/bullets-vim/bullets.vim" })
    end,
})
