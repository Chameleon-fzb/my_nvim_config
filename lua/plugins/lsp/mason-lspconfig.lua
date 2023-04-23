return {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		local myServer = require("plugins.lsp.config.myServer")
		local MyServer = {}
		for key, value in pairs(myServer) do
			local server = (type(key) == "number" and value) or key
			table.insert(MyServer, server)
		end
		mason_lspconfig.setup({
			ensure_installed = MyServer,
			-- 自动安装设置 true false automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
			automatic_installation = true,
			log_level = vim.log.levels.DEBUG,
		})
	end,
}
