vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", "target", "vendor" },
    },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search for string in files" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Search Recent Files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto definition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
