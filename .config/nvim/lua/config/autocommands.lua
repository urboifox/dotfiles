-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Remove quick fix item when pressing dd
local function remove_qf_item()
    local qf_list = vim.fn.getqflist()
    local curqfidx = vim.fn.line '.'
    table.remove(qf_list, curqfidx)
    vim.fn.setqflist(qf_list, 'r')
    vim.cmd((curqfidx + 1) .. 'cfirst')
    vim.cmd 'copen'
end

vim.api.nvim_create_user_command('RemoveQFItem', remove_qf_item, {})

-- Neovim ships ftplugin for svelte but no syntax/svelte.vim and no vim.treesitter.start()
-- (unlike e.g. lua). Start Tree-sitter here so highlighting matches ensure_installed.
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'svelte',
    callback = function(ev)
        local buf = ev.buf
        vim.treesitter.start(buf)
        vim.b[buf].undo_ftplugin = (vim.b[buf].undo_ftplugin or '')
            .. ' | lua vim.treesitter.stop()'
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
        vim.keymap.set('n', 'dd', ':RemoveQFItem<CR>', { buffer = true, silent = true })
    end,
})

-- prevent commenting the next line to a comment
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove { 'r', 'o' }
    end,
})
