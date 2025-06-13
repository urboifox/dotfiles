local opt = vim.opt

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.title = true
vim.opt.titlestring = 'NVIM: %F' -- %t %m %r

vim.opt.termguicolors = true

-- prevent commenting the next line to a comment
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove { 'r', 'o' }
    end,
})

-- add http extension to filetype
vim.filetype.add {
    extension = {
        http = 'http',
    },
}

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4 -- spaces or tabs
opt.softtabstop = 4
opt.shiftwidth = 4 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false -- line wrap

-- Enable mouse mode, can be useful for resizing splits for example! opt.mouse = ''

-- set the cursor to be block
opt.guicursor = ''

-- Don't show the mode, since it's already in the status line
opt.showmode = true

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 20

-- Folding
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 1 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldclose = 'all'
