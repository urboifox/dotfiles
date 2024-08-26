vim.g.mapleader = " " -- leader key <Space>

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal in size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join bottom line with current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz",	{ desc = "Scroll half page up" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paster without losing the previous yanked text" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to void registry" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to next error" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to previous error" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to quicfix list next entry" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to quicfix list previous entry" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Change the current word in the whole file" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make the current file executable" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
