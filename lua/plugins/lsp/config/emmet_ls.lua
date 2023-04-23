local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require("plugins.lsp.config.on_attach")
return {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"css",
		"scss",
		"javascriptreact",
		"typescriptreact",
		"haml",
		"xml",
		"xsl",
		"pug",
		"slim",
		"sass",
		"stylus",
		"less",
		"sss",
		"hbs",
		"handlebars",
		"vue",
	},
}
