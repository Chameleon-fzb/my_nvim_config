-- nvim-tree 文件管
return {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	tag = "nightly",
	event = "VeryLazy",
	keys = {
		{ "<A-m>", ":NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
	},
	config = function()
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1
		local nvim_tree = require("nvim-tree")

		-- 列表操作快捷键
		local list_keys = require("keybindings").nvimTreeList
		nvim_tree.setup({
			-- 不显示 git 状态图标
			git = {
				enable = false,
			},
			-- project plugin 需要这样设置
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			-- 隐藏 .文件 和 node_modules 文件夹
			filters = {
				dotfiles = true,
				--         custom = { 'node_modules' },
				--         custom = {},
			},
			view = {
				--     adaptive_size = true,
				-- 宽度
				width = 30,
				-- 也可以 'right'
				side = "left",
				-- 隐藏根目录
				hide_root_folder = false,
				-- 自定义列表中快捷键
				mappings = {
					custom_only = false,
					list = list_keys,
				},
				-- 不显示行数
				number = false,
				relativenumber = false,
				-- 显示图标
				signcolumn = "yes",
			},
			actions = {
				open_file = {
					-- 首次打开大小适配
					resize_window = true,
					-- 打开文件时关闭
					quit_on_open = true,
				},
			},
		})
		vim.api.nvim_create_autocmd({ "QuitPre" }, {
			callback = function()
				vim.cmd("NvimTreeClose")
			end,
		})
		----自动关闭
		-- vim.cmd([[
		--     autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
		-- ]])
	end,
}
