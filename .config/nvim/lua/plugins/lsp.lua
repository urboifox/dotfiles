return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup {
                automatic_enable = false,
                ensure_installed = {
                    'lua_ls',
                    'svelte',
                },
            }
        end,
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                lua_ls = {},
                svelte = {},
                ts_ls = {},
                tailwindcss = {},
                emmet_ls = {
                    filetypes = {
                        'html',
                        'typescriptreact',
                        'javascriptreact',
                        'css',
                        'svelte',
                    },
                },
            },
        },
        config = function(_, opts)
            local lspconfig = require 'lspconfig'

            for server, config in pairs(opts.servers) do
                -- config.capabilities = require('cmp_nvim_lsp').default_capabilities()
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

                if server == 'svelte' then
                    -- INFO: https://github.com/sveltejs/language-tools/issues/2008#issuecomment-2148860446
                    config.capabilities.workspace = config.capabilities.workspace or {}
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    config.capabilities.workspace.didChangeWatchedFiles = false
                    lspconfig[server].setup(config)
                else
                    lspconfig[server].setup(config)
                end
            end

            -- Change diagnostic symbols in the sign column (gutter)
            if vim.g.have_nerd_font then
                local signs = { Error = '', Warn = '', Hint = '', Info = '' }
                for type, icon in pairs(signs) do
                    local hl = 'DiagnosticSign' .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end
            end
        end,
    },
}
