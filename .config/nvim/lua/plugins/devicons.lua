return {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
        enabled = vim.g.have_nerd_font,
        config = function()
            local devicons = require 'nvim-web-devicons'
            devicons.setup {
                override = {
                    css = {
                        icon = '',
                        color = '#264de9',
                        name = 'CSS',
                    },
                    ts = {
                        icon = '',
                        color = '#3178c6',
                        name = 'TypeScript',
                    },
                    js = {
                        icon = '',
                        color = '#f1e05a',
                        name = 'JavaScript',
                    },
                    ['stories.svelte'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.vue'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.js'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.mjs'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.ts'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.tsx'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                    ['stories.jsx'] = {
                        icon = '',
                        color = '#ff4785',
                        name = 'Storybook',
                    },
                },
            }
        end,
    },
}
