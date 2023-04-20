-- 翻译
return {
	"JuanZoran/Trans.nvim",
	event = "BufRead",
	keys = {
		-- 可以换成其他你想映射的键
		{ "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
		{ "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
		-- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
		{ "mi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
	},
	dependencies = { "kkharji/sqlite.lua", lazy = true },
	build = function()
		require("Trans").install()
	end, -- 自动下载使用的本地词库
	opts = {},
}
