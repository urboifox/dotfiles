vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup({
    auto_install = true,
    ensure_installed = {
        "lua",
        "svelte",
        "typescript",
        "tsx",
        "jsx",
        "ecma",
        "css",
        "html",
        "html_tags",
        "javascript",
        "json",
        "markdown",
    },
    highlight = {
        enable = true,
    },
    indent = { enable = true },
})
