return {
	"nmac427/guess-indent.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("guess-indent").setup({})
	end,
}
