return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
        require('rose-pine').setup {
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            variant = 'main',
            dark_variant = 'main',

            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true,
            },

            highlight_groups = {
                CursorLine = { bg = 'None' },
                -- StatusLine = { fg = "love", bg = "muted", blend = 15 },
                VertSplit = { fg = 'muted', bg = 'muted' },
                -- Visual = { fg = 'iris', bg = 'none', inherit = false },
                Visual = { fg = 'base', bg = 'text', inherit = false },
            },

            groups = {
                border = 'muted',
                link = 'iris',
                panel = 'surface',

                error = 'love',
                hint = 'iris',
                info = 'foam',
                note = 'pine',
                todo = 'rose',
                warn = 'gold',

                git_add = 'foam',
                git_change = 'rose',
                git_delete = 'love',
                git_dirty = 'rose',
                git_ignore = 'muted',
                git_merge = 'iris',
                git_rename = 'pine',
                git_stage = 'iris',
                git_text = 'rose',
                git_untracked = 'subtle',

                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                --     base = '#18191a',
                --     overlay = '#363738',
                -- },
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
        }

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded', -- options: "single", "double", "rounded", "solid", "shadow", or custom table
        })

        vim.cmd 'colorscheme rose-pine'
    end,
}
