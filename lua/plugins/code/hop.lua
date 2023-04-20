return {
	"phaazon/hop.nvim",
	branch = "v2", -- optional but strongly recommended
	event = "BufRead",
	keys = {
		{ "E", "<cmd>HopChar1<cr>", desc = "HopChar1" },
	},
	config = function()
		require("hop").setup({ keys = "asdghklqwertyuiopzxcvbnmfj" })
		-- local hop = require("hop")
		-- -- local directions = require("hop.hint").HintDirection
		-- vim.keymap.set("", "f", function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		-- end, { remap = true })
		-- vim.keymap.set("", "F", function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		-- end, { remap = true })
		-- vim.keymap.set("", "t", function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		-- end, { remap = true }q
		-- vim.keymap.set("", "T", function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		-- end, { remap = true })
		-- vim.api.nvim_set_keymap("n", "R", "<cmd>HopChar2<cr>", { silent = true })
		-- vim.api.nvim_set_keymap("n", "E", "<cmd>HopChar1<cr>", { silent = true })
		-- vim.api.nvim_set_keymap("n", "U", "<cmd>HopWord<cr>", { silent = true })
		-- vim.api.nvim_set_keymap("n", "C", "<cmd>HopLine<cr>", { silent = true })
		-- vim.api.nvim_set_keymap("n", "P", "<cmd>HopPattern<cr>", { silent = true })
	end,
}
