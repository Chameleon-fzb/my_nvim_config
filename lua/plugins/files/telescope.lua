-- telescope 查找文件
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"ahmedkhalf/project.nvim",
	},
	keys = {
		-- { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
		-- { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Strings" },
		-- { "<leader>s?", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		-- { "<leader>sh", "<cmd>Telescope heading<cr>", desc = "Headings" },
		-- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		-- { "<leader>sO", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
		-- { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
		-- { "<leader>sR", "<cmd>Telescope regiesters<cr>", desc = "Registers" },
		-- { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Text under cursor" },
		-- { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Emoji" },
		-- { "<leader>s:", "<cmd>Telescope search_history<cr>", desc = "Search History" },
		-- { "<leader>s;", "<cmd>Telescope command_history<cr>", desc = "Command history" },
		-- files
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Open file" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Strings" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buf" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "^./.git/", "^node_modules/", "^./fcitx5-sogou-themes/" },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim", -- add this value
				},
				-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
				initial_mode = "insert",
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				wrap_results = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.90,
					height = 0.80,
					-- preview_cutoff = 120,
					prompt_position = "top",
					horizontal = {
						preview_width = function(_, cols, _)
							if cols > 200 then
								return math.floor(cols * 0.5)
							else
								return math.floor(cols * 0.6)
							end
						end,
					},
					vertical = { width = 0.9, height = 0.95, preview_height = 0.6 },
					flex = { horizontal = { preview_width = 0.9 } },
				},
				-- 窗口内快捷键
				mappings = require("keybindings").telescopeList,
			},
			pickers = {
				-- 内置 pickers 配置
				buffers = {
					ignore_current_buffer = true,
					sort_lastused = true,
				},
				find_files = {
					-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
					theme = "ivy",
					find_command = {
						"fd",
						"--type",
						"f",
						"-g",
						"-H",
						"--exclude={.git,.vscode,.local,node_modules,build,.nvm,.cache,.zsh,.rustup,pkg,.cargo}",
						"-j=8",
						"--strip-cwd-prefix",
					},
				},
			},
			extensions = {
				-- 扩展插件配置
				fzf = {
					fuzzy = false, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		pcall(telescope.load_extension, "projects")
		pcall(telescope.load_extension, "fzf")
	end,
}
