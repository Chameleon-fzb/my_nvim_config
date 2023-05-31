return {
	-- 标签页
	"akinsho/bufferline.nvim",
	event = { "BufNewFile", "BufReadPre" },
	version = "v3.*",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
	keys = {
		{ "<leader>h", "<cmd>BufferLineCyclePrev<cr>", desc = "Bur To Prev" },
		{ "<leader>l", "<cmd>BufferLineCycleNext<cr>", desc = "Bur To Next" },
		{ "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Goto Buffer 1" } },
		{ "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Goto Buffer 2" } },
		{ "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Goto Buffer 3" } },
		{ "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Goto Buffer 4" } },
		{ "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Goto Buffer 5" } },
		{ "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Goto Buffer 6" } },
		{ "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Goto Buffer 7" } },
		{ "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Goto Buffer 8" } },
		{ "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Goto Buffer 9" } },
		{ "<leader>p", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin Buffer" } },
		{ "<leader>d", "<Cmd>bdelete<CR>", { desc = "Delete Current Buf" } },
		{ "<leader>s", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer" } },
		{
			"<leader>da",
			"<Cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<CR>",
			{ desc = "Del all Buf, keep current Buf" },
		},
	},
	opts = {
		options = {
			-- always_show_bufferline = false,
			mode = "buffers",
			numbers = function(opts)
				local tmpid = opts.ordinal > 9 and 10 or opts.ordinal
				local icons = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "󰿮" }
				return icons[tmpid]
			end,
			-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
			close_command = "Bdelete! %d",
			right_mouse_command = "Bdelete! %d",
			separator_style = "slant",
			hover = { enabled = true, delay = 100, reveal = { "close" } },
			indicator = {
				icons = "",
				style = "underline",
			},
			buffer_close_icon = "󰖭",
			-- 左侧让出 nvim-tree 的位置，显示文字
			offsets = {
				{
					filetype = "NvimTree",
					text = "NvimTree",
					highlight = "Directory",
					text_align = "center",
				},
			},
			diagnostics = "nvim_lsp",
			---@diagnostic disable-next-line: unused-local
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local Signs = require("plugins.lsp.config.M").Signs
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and Signs.Error or (e == "warning" and Signs.Warn or Signs.Info)
					s = s .. n .. sym
				end
				return s
			end,
		},
		highlights = {
			buffer_selected = {
				fg = "#88C0b0",
				bold = true,
				italic = true,
			},
			close_button = {
				fg = "#b988b0",
			},
			close_button_visible = {
				fg = "#b988b0",
				bold = true,
			},
			close_button_selected = {
				fg = "#b988b0",
				bold = true,
			},
			indicator_visible = {
				fg = "#b988b0",
				bold = true,
			},
			indicator_selected = {
				fg = "#b988b0",
				sp = "#FF80A0",
				bold = true,
				underdouble = true,
				underline = true,
			},
			pick_selected = {
				fg = "#cf314a",
				bold = true,
				italic = true,
			},
			pick_visible = {
				fg = "#cf314a",
				bold = true,
				italic = true,
			},
			pick = {
				fg = "#cf314a",
				bold = true,
				italic = true,
			},
			tab_selected = {
				fg = "#A3BE8C",
				sp = "red",
				bold = true,
				-- underline = true,
				-- undercurl = true,
			},
			numbers = {
				bold = true,
			},
			numbers_visible = {
				bold = true,
			},
			numbers_selected = {
				fg = "#b988b0",
			},
			modified_selected = {
				fg = "#E23D75",
			},
			duplicate_selected = {
				fg = "#99c794",
			},
		},
	},
	config = function(_, opts)
		local bufferline = require("bufferline")
		bufferline.setup(opts)
	end,
}
