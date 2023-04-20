-- local with_root_file = function(...)
--     local files = { ... }
--     return function(utils)
--         return utils.root_has_file(files)
--     end
-- end

return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins
		local formatting = builtins.formatting
		local diagnostics = builtins.diagnostics
		local code_actions = builtins.code_actions
		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end
		-- if you want to set up formatting on save, you can use this as a callback
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		-- add to your shared on_attach callback
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				-- vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
				-- 	lsp_formatting(bufnr)
				-- end, {})
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					-- command = "undojoin | LspFormatting",
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end
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
						"yaml",
						"vue",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
				}),
				diagnostics.eslint_d,
				code_actions.eslint_d,
				--code_actions.gitsigns,
				-- code_actions.eslint.with({
				-- 	prefer_local = "node_modules/.bin",
				-- }),
			},
			diagnostics_format = "[#{c}] #{m} (#{s})",
			on_attach = on_attach,
		})
	end,
}
