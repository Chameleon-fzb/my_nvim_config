--浮动终端
return {
	"numToStr/FTerm.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("FTerm").setup({
			border = "double",
			dimensions = {
				height = 0.6,
				width = 0.6,
			},
		})
		-- Example keybindings
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
