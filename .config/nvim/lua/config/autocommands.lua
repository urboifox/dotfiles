-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- set the current directory to the directory nvim opened in
local arg = vim.fn.argv(0)
if type(arg) == "table" then
    arg = arg[1]
end
if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
    vim.cmd("cd " .. vim.fn.fnameescape(arg))
end

-- Remove quick fix item when pressing dd
local function remove_qf_item()
    local qf_list = vim.fn.getqflist()
    local curqfidx = vim.fn.line(".")
    table.remove(qf_list, curqfidx)
    vim.fn.setqflist(qf_list, "r")
    vim.cmd((curqfidx + 1) .. "cfirst")
    vim.cmd("copen")
end

vim.api.nvim_create_user_command("RemoveQFItem", remove_qf_item, {})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "dd", ":RemoveQFItem<CR>", { buffer = true, silent = true })
    end,
})

-- prevent commenting the next line to a comment
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

local treesitter_autostart = vim.api.nvim_create_augroup("treesitter-autostart", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = treesitter_autostart,
    pattern = { "svelte", "typescriptreact", "javascriptreact", "css", "scss", "less" },
    callback = function(ev)
        local buf = ev.buf
        pcall(vim.treesitter.start, buf)
        vim.b[buf].undo_ftplugin = (vim.b[buf].undo_ftplugin or "") .. " | lua pcall(vim.treesitter.stop)"
    end,
})
