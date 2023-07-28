return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "b0o/schemastore.nvim" },
		-- { "jose-elias-alvarez/nvim-lsp-ts-utils", dependencies = "nvim-lua/plenary.nvim" },
		{ "jose-elias-alvarez/typescript.nvim", dependencies = "nvim-lua/plenary.nvim" },
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local C = require("plugins.lsp.config.M").Clients
		for name, config in pairs(C) do
			config.capabilities = capabilities
			nvim_lsp[name].setup(config)
		end
		-- require("typescript").setup({})
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = false,
		})
	end,
}
