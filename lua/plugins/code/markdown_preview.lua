-- markdown
return {
	"iamcco/markdown-preview.nvim",
	-- event = 'BufRead',
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = "markdown",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	keys = {
		{ "<A-b>", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
	},
	config = function()
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_browser = "microsoft-edge-stable"
		vim.g.mkdp_markdown_css = "/home/fzb/.config/nvim/static/markdown.css"
		vim.g.mkdp_highlight_css = "/home/fzb/.config/nvim/static/highlight.css"
		vim.g.mkdp_theme = "light"
	end,
}
