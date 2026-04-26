vim.filetype.add({
    extension = {
        ["http"] = "http",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "http",
    callback = function()
        vim.pack.add({ "https://github.com/mistweaverco/kulala.nvim" })
        require("kulala").setup({
            global_keymaps = true,
            lsp = { formatter = true },
            ui = { display_mode = "split" },
        })

        vim.keymap.set("n", "<leader>ke", function()
            vim.ui.input({
                prompt = "Kulala export path: ",
                default = vim.fn.getcwd(),
            }, function(input)
                if not input or input == "" then
                    return
                end

                require("kulala").export(input)
            end)
        end, { buffer = true, desc = "Export Kulala request" })

        vim.treesitter.start()
    end,
})
