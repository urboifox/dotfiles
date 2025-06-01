-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal in size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the top split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right split' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left split' })
vim.keymap.set('n', '<C-o>', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<C-i>', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })

-- lines management
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move current line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move current line up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join bottom line with current line' })
vim.keymap.set('n', 'd_', 'd^', { noremap = true, desc = 'Delete to the first non-blank character of the line' })

-- scrolling configuration
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half page up' })
vim.keymap.set({ 'n', 'v' }, '<S-Down>', '<Down>') -- disable scrolling Down with shift
vim.keymap.set({ 'n', 'v' }, '<S-Up>', '<Up>') -- disable scrolling Up with shift

-- clipboard
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paster without losing the previous yanked text' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void registry' })

-- quitting
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode with jk' })

-- errors
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Go to next error' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Go to previous error' })

-- quickfix list
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Go to quicfix list next entry' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Go to quicfix list previous entry' })

-- commands
vim.keymap.set('n', '<leader>cw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change the current word in the whole file' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make the current file executable' })

-- LSP
vim.keymap.set('n', '<leader>lr', '<cmd>:LspRestart<cr>', { desc = 'Restart LSP server' })

-- tmux
vim.keymap.set('n', '<leader>fp', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Find projects with tmux sessionizer' })

-- theme
vim.keymap.set('n', '<leader>tc', '<cmd>Telescope colorscheme<CR>', { desc = 'Select colorscheme' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
