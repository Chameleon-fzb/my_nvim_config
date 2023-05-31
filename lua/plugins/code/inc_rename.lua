return {
	"smjonas/inc-rename.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("inc_rename").setup({ presets = { inc_rename = true } })
		vim.keymap.set("n", "rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true })
		-- vim.keymap.set("n", "<leader>rn", ":IncRename ")
	end,
}
