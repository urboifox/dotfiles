return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		-- prettier options
		local tabwidth = 4
		local prettier_options = "--tab-width " .. tabwidth

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier " .. prettier_options },
				typescript = { "prettier " .. prettier_options },
				javascriptreact = { "prettier " .. prettier_options },
				typescriptreact = { "prettier " .. prettier_options },
				svelte = { "prettier " .. prettier_options },
				css = { "prettier " .. prettier_options },
				html = { "prettier " .. prettier_options },
				json = { "prettier " .. prettier_options },
				yaml = { "prettier " .. prettier_options },
				markdown = { "prettier " .. prettier_options },
				graphql = { "prettier " .. prettier_options },
				liquid = { "prettier " .. prettier_options },
				cpp = { "prettier " .. prettier_options },
				c = { "prettier " .. prettier_options },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "f=", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
