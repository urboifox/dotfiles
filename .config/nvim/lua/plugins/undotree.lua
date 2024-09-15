return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

		local opt = vim.opt

		-- presist undo
		opt.swapfile = false
		opt.backup = false
		opt.undofile = true
		opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
	end,
}
