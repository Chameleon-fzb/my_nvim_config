return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins
		local formatting = builtins.formatting
		---@diagnostic disable-next-line: unused-local
		local diagnostics = builtins.diagnostics
		---@diagnostic disable-next-line: unused-local
		local code_actions = builtins.code_actions
		local on_attach = require("plugins.lsp.config.M").on_attach
		null_ls.setup({
			debug = false,
			sources = {
				formatting.shfmt,
				formatting.stylua,
				formatting.prettierd.with({
					extra_args = {
						"--single-quote",
						"--no-semi",
						"--jsx-single-quote",
						"--arrow-parens avoid",
					},
					filetypes = {
						"markdown",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"css",
						"scss",
						"less",
						"html",
						"json",
						"jsonc",
						"yaml",
						"vue",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
				}),
				-- formatting.prettierd,
				diagnostics.eslint_d,
				code_actions.eslint_d,
				--code_actions.gitsigns,
				-- code_actions.eslint.with({
				-- }),
			},
			diagnostics_format = "[#{c}] #{m} (#{s})",
			require("typescript.extensions.null-ls.code-actions"),
			on_attach = on_attach,
		})
	end,
}
