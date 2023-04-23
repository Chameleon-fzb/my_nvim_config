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

		nvim_lsp.html.setup(M.html)
		nvim_lsp.emmet_ls.setup(M.emmet_ls)
		nvim_lsp.cssls.setup(M.cssls)
		nvim_lsp.cssmodules_ls.setup(M.cssmodules_ls)
		nvim_lsp.tailwindcss.setup(M.tailwindcss)
		nvim_lsp.jsonls.setup(M.jsonls)
		-- TypeScript
		nvim_lsp.tsserver.setup(M.ts)
		nvim_lsp.lua_ls.setup(M.lua_ls)
		nvim_lsp.gopls.setup(M.gopls)
		nvim_lsp.volar.setup(M.volar)
		-- nvim_lsp.eslint.setup(M.eslint)

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
