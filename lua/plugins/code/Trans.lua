return {
	"JuanZoran/Trans.nvim",
	event = "VeryLazy",
	build = function()
		require("Trans").install()
	end,
	keys = {
		{ "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
		{ "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
		{ "mi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
	},
	dependencies = { "kkharji/sqlite.lua" },
	opts = {},
}
