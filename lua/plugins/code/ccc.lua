return {
	"uga-rosa/ccc.nvim",
	enabled = false,
	event = "CursorHold",
	keys = {
		{ "<leader>c", "<cmd>CccPick<cr>" },
		{ "<leader>cc", "<cmd>CccConvert<cr>" },
	},
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})
	end,
}
