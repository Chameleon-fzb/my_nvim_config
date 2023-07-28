return {
	"kevinhwang91/rnvimr",
	enabled = true,
	event = "VeryLazy",
	cmd = { "RnvimrToggle" },
	keys = {
		{ "<leader>f", "<cmd>Ranger<cr>", desc = "Ranger Open" },
	},
	config = function()
		vim.api.nvim_create_user_command("Ranger", function()
			vim.cmd(":RnvimrToggle")
		end, { nargs = "*" })
	end,
}
