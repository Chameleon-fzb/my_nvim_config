return {
	"ggandor/leap.nvim",
	lazy = true,
	keys = { "S", "s", "W", "dr", "dR", "yr", "yR", "cr", "cR" },
	config = function()
		require("leap").opts.highlight_unlabeled_phase_one_targets = true
		-- leap.add_default_mappings()
		vim.keymap.set({ "x", "o", "n" }, "s", "<Plug>(leap-forward-to)")
		vim.keymap.set({ "x", "o", "n" }, "S", "<Plug>(leap-backward-to)")
		vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")
	end,
}
 