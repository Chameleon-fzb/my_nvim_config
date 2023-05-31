return {
	"vuki656/package-info.nvim",
	event = "VeryLazy",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		local pack = require("package-info")
		pack.setup()
		local mapSet = require("utils").K.mapSet

		-- Show dependency versions
		mapSet({ "n" }, "<LEADER>ns", require("package-info").show)

		-- Hide dependency versions
		mapSet({ "n" }, "<LEADER>nc", require("package-info").hide)

		-- Toggle dependency versions
		mapSet({ "n" }, "<LEADER>nt", require("package-info").toggle)

		-- Update dependency on the line
		mapSet({ "n" }, "<LEADER>nu", require("package-info").update)

		-- Delete dependency on the line
		mapSet({ "n" }, "<LEADER>nd", require("package-info").delete)

		-- Install a new dependency
		mapSet({ "n" }, "<leader>ni", require("package-info").install)

		-- Install a different dependency version
		mapSet({ "n" }, "<LEADER>np", require("package-info").change_version)
	end,
}
