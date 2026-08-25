require("config")

-- auto confirm new packages installation
vim.g.vim_pack_auto_confirm = true

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "tailwindcss",
    },
    automatic_enable = {
        exclude = { "htmx" },
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("cssls", {
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
        },
    },
})

-- enable lsp for gdscript
vim.lsp.config("gdscript", {
    cmd = { "nc", "127.0.0.1", "6005" },
    filetypes = { "gdscript" },
    root_markers = { "project.godot", ".git" },
})

vim.lsp.enable("gdscript")
