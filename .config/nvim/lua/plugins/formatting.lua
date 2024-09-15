return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local prettier_command = "prettier"

		conform.setup({
			formatters_by_ft = {
				javascript = { prettier_command },
				typescript = { prettier_command },
				javascriptreact = { prettier_command },
				typescriptreact = { prettier_command },
				-- svelte = { prettier_command }, -- svelte language server has formatting by default, so i disabled this
				css = { prettier_command },
				html = { prettier_command },
				json = { prettier_command },
				yaml = { prettier_command },
				markdown = { prettier_command },
				graphql = { prettier_command },
				liquid = { prettier_command },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>f=", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
