vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

        require("render-markdown").setup({
            preset = "none", -- Avoids default styles that may include backgrounds
            file_types = { "markdown" },
            render_modes = { "n", "c", "t" },
            code = {
                disable_background = true,
                highlight_border = false,
                style = "language",
            },
            heading = {
                backgrounds = { "NONE" },
            },
            inline_code = {
                hl_group = "NONE",
            },
        })
    end,
})
