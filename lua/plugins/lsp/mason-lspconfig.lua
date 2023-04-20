return {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local MyServer = {
			"lua_ls",
			"bashls",
			"cssls",
			"cssmodules_ls",
			"eslint",
			"emmet_ls",
			"html",
			"jsonls",
			"quick_lint_js",
			"tsserver",
			"tailwindcss",
			"volar",
			"lemminx",
			"yamlls",
			"marksman",
			-- 	"golangci_lint_ls",
			"gopls",
		}
		mason_lspconfig.setup({
			ensure_installed = MyServer,
			-- 自动安装设置 true false automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
			automatic_installation = true,
			log_level = vim.log.levels.DEBUG,
		})
	end,
}
