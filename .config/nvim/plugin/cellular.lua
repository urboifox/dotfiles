vim.pack.add({ "https://github.com/eandrju/cellular-automaton.nvim" })

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", { desc = "Make it rain" })
