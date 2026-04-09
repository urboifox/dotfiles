vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })

require("supermaven-nvim").setup({
    ignore_filetypes = { cpp = true, c = true, rust = true, python = true },
    log_level = "off",
    condition = function()
        return false
    end,
})
