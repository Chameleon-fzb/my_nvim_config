return {
	"williamboman/mason.nvim",
	lazy = true,
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonLog",
		"MasonUpdate",
		"MasonUpdateAll",
	},
	opts = {
		ui = {
			icons = {
				package_installed = "🟢",
				package_pending = "⬇",
				package_uninstalled = "📛",
			},
		},
	},
}
