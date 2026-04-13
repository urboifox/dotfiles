vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.pack.add({ "https://github.com/epwalsh/obsidian.nvim" })

        require("obsidian").setup({
            workspaces = {
                {
                    name = "notes",
                    path = "~/workspace/notes",
                },
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ "xdg-open", url }, {
                    detach = true,
                    stdout_buffered = false,
                    stderr_buffered = false,
                })
            end,
            ui = {
                enable = false,
            },
            daily_notes = {
                default = nil,
                folder = "daily",
                default_tags = { "daily" },
            },
            note_frontmatter_func = function(note)
                local created = (note.metadata and note.metadata.created) or os.date("%Y-%m-%d")
                return {
                    id = note.id,
                    tags = note.tags,
                    created = created,
                }
            end,
            note_id_func = function(title)
                return title and title:gsub(" ", "-"):lower() or tostring(os.time())
            end,
        })

        -- Mappings
        vim.keymap.set("n", "<leader>on", function()
            local fname = vim.fn.input("Note name: ")
            if fname ~= "" then
                vim.cmd("ObsidianNew " .. fname)
            end
        end, { desc = "New note" })

        vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "Paste image" })
        vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename note" })
        vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTOC<cr>", { desc = "Table of contents" })
        vim.keymap.set("n", "<leader>odt", "<cmd>ObsidianToday<cr>", { desc = "Today's note" })
        vim.keymap.set("n", "<leader>ody", "<cmd>ObsidianYesterday<cr>", { desc = "Yesterday's note" })
        vim.keymap.set("n", "<leader>odd", "<cmd>ObsidianDailies<cr>", { desc = "Daily notes" })
        vim.keymap.set("n", "<leader>oft", "<cmd>ObsidianTags<cr>", { desc = "Find tags" })
    end,
})
