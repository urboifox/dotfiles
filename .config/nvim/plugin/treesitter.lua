vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").install({
    "lua",
    "svelte",
    "typescript",
    "css",
    "html",
    "tsx",
    "javascript",
    "json",
    "go",
    "markdown",
    "markdown_inline",
})
