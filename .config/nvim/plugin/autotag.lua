vim.api.nvim_create_autocmd("InsertEnter", {
    once = true,
    callback = function()
        vim.pack.add({
            "https://github.com/numToStr/Comment.nvim",
            "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
        })

        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
})
