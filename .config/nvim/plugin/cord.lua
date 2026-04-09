vim.pack.add({ "https://github.com/vyfor/cord.nvim" })

require("cord").setup({
    server = {
        autocmd = true,
    },
    display = {
        theme = "atom",
    },
    idle = {
        enabled = false,
    },
    editor = {
        tooltip = "The one true text editor",
    },
})
