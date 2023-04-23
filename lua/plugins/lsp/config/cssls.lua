local on_attach = require("plugins.lsp.config.on_attach")
return {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = {
		"css",
		"scss",
		"less",
		"vue",
	},
}
