return {
	"folke/trouble.nvim",
	event = "BufRead",
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
	},
	opts = {},
}
