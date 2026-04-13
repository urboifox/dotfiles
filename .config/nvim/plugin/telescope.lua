vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", "target", "vendor" },
    },
})

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
        if not vim.loop.fs_stat(dir .. "/build/libfzf.so") then
            local cwd = vim.fn.getcwd()
            vim.fn.chdir(dir)
            vim.fn.system(
                vim.loop.os_uname().sysname:match("Windows")
                        and { "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" }
                    or { "make" }
            )
            vim.fn.chdir(cwd)
        end
        pcall(require("telescope").load_extension, "fzf")
    end,
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search for string in files" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Search Recent Files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

-- vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
