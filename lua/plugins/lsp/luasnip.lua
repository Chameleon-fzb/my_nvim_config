return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	version = "<CurrentMajor>.*",
	build = "make install_jsregexp",
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	keys = {
		{
			"<tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<s-tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
	},
	config = function(_, opts)
		require("luasnip").setup(opts)
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/friendly-snippets" })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
	end,
}
