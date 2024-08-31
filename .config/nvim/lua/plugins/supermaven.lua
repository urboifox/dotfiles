return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
            ignore_filetypes = { cpp = true, c = true, rust = true, python = true },
            condition = function()
                return false
            end
        })
	end,
}
