return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	keys = {},
	config = function()
		require("neoscroll").setup()
		local t = {}
		-- Syntax: t[keys] = {function, {function arguments}}
		t["<C-k>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
		t["<C-j>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
		t["<C-u>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "350" } }
		t["<C-d>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "350" } }
		t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
		t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
		t["zt"] = { "zt", { "250" } }
		t["zz"] = { "zz", { "250" } }
		t["zb"] = { "zb", { "250" } }

		require("neoscroll.config").set_mappings(t)
	end,
}
