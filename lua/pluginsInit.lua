local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		-- {import = "plugins"},
		{ import = "plugins.ui" },
		{ import = "plugins.files" },
		{ import = "plugins.code" },
		{ import = "plugins.lsp" },
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "onenord" },
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"matchit",
				"rplugin",
			},
		},
	},
})
