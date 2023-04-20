return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		dependencies = {
			-- "HiPhish/nvim-ts-rainbow2",
			"JoosepAlviste/nvim-ts-context-commentstring",
			-- "nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				ensure_installed = {
					"bash",
					"json",
					"html",
					"c",
					"cpp",
					"bash",
					"scss",
					"vim",
					"lua",
					"javascript",
					"vue",
					"markdown",
					"markdown_inline",
					"typescript",
					"tsx",
					"css",
					"yaml",
				},
				--   ensure_installed ={"html"},
				-- context_commentstring = {
				-- 	enable = true,
				-- },
				-- 启用代码高亮模块
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = {},
				},
				-- 启用增量选择模块
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						node_decremental = "<BS>",
						scope_incremental = "<TAB>",
					},
				},
				-- 启用代码缩进模块 (=)
				indent = {
					enable = true,
					disable = {},
				},
				-- rainbow = {
				-- 	enable = true,
				-- 	-- list of languages you want to disable the plugin for
				-- 	disable = { "jsx", "cpp" },
				-- 	-- Which query to use for finding delimiters
				-- 	query = {
				-- 		"rainbow-parens",
				-- 		html = "rainbow-tags",
				-- 		latex = "rainbow-blocks",
				-- 		javascript = "rainbow-tags-react",
				-- 		vue = "rainbow-tags",
				-- 		tsx = "rainbow-tags",
				-- 	},
				-- 	-- Highlight the entire buffer all at once
				-- 	strategy = require("ts-rainbow").strategy.global,
				-- },
				autotag = {
					enable = true,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
			-- 开启 Folding 模块
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			-- 默认不要折叠
			-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
			vim.opt.foldlevel = 99
		end,
	},
}
