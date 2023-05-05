return {
	"glepnir/lspsaga.nvim",
	event = { "LspAttach" },
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			preview = {
				lines_above = 0,
				lines_below = 10,
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			request_timeout = 2000,
			rename = {
				quit = "<C-c>",
				exec = "<CR>",
				mark = "x",
				confirm = "<CR>",
				in_select = true,
			},
			ui = {
				expand = "",
				collapse = " ",
				kind = require("plugins.lsp.config.M").SagaIcons,
			},
			symbol_in_winbar = {
				enable = true,
				separator = "  ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = true,
				color_mode = true,
			},
		})
		local keymap = vim.keymap.set
		keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
		-- Code action
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
		-- 重命变量名
		keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>")
		-- 重命名 项目中所有引入该变量的名字
		keymap("n", "<leader>r", "<cmd>Lspsaga rename ++project<CR>")
		-- 查看其它代码
		keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
		-- Go to definition
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
		keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
		keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
		keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
	end,
}
