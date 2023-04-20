return {
	"ahmedkhalf/project.nvim",
	lazy = true,
	opts = {
		detection_methods = { "pattern" },
		patterns = {
			"=src",
			".git",
			"_darcs",
			".hg",
			".bzr",
			".svn",
			"Makefile",
			"package.json",
			".sln",
			"node_modules",
		},
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
}
