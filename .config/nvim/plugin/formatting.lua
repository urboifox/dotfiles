vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
    notify_on_error = false,
    format_on_save = false,
    formatters_by_ft = {
        lua = { "stylua" },

        python = { "isort", "black" },

        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { "prettier", stop_after_first = true },
        json = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        html = { "prettier", stop_after_first = true },
        css = { "prettier", stop_after_first = true },
        http = { "kulala", stop_after_first = true },
    },
})

vim.keymap.set("n", "<leader>f=", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
