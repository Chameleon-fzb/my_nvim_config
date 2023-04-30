return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "b0o/schemastore.nvim" },
		{ "jose-elias-alvarez/nvim-lsp-ts-utils", dependencies = "nvim-lua/plenary.nvim" },
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local M = require("plugins.lsp.config.M")
		for name, config in pairs(M) do
			nvim_lsp[name].setup(config)
		end
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			-- 在输入模式下也更新提示，设置为 true 也许会影响性能
			update_in_insert = true,
		})
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
