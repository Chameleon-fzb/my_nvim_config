return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	config = function()
		vim.g.indent_blankline_context_char = "▎"
		require("indent_blankline").setup({
			space_char_blankline = " ",
			show_current_context = true,
			show_trailing_blankline_indent = false,
			-- show_current_context = false,
			show_current_context_start = true,
			use_treesitter = true,
			use_treesitter_scope = true,
			show_end_of_line = true,
			char = "▎",
			context_char = "▎",
			-- context_patterns = {
			-- 	"class",
			-- 	"function",
			-- 	"method",
			-- 	"element",
			-- 	"^if",
			-- 	"^while",
			-- 	"^for",
			-- 	"^object",
			-- 	"^table",
			-- 	"block",
			-- 	"arguments",
			-- },
			-- -- :echo &filetype
			-- filetype_exclude = {
			-- 	"dashboard",
			-- 	"packer",
			-- 	"terminal",
			-- 	"help",
			-- 	"log",
			-- 	"markdown",
			-- 	"TelescopePrompt",
			-- 	"lsp-installer",
			-- 	"lspinfo",
			-- 	"toggleterm",
			-- },
		})
	end,
}
