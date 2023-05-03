return {
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = {
		"css",
		"scss",
		"less",
		-- "vue",
	},
	settings = {
		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
		less = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
}
