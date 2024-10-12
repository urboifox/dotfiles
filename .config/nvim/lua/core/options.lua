vim.cmd("let g:netrw_liststyl = 3")

local opt = vim.opt

opt.guicursor = "" -- set the cursor to be block

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces or tabs
opt.softtabstop = 2
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.backup = false
opt.wrap = false -- line wrap

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixes case in your search, assumes you want case-sensitive

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window the the bottom

opt.scrolloff = 25 -- scroll gap 25 lines

opt.hlsearch = false
opt.incsearch = true
