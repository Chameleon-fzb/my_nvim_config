return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		local function week_ascii_text()
			return {
				["Monday"] = {
					"",
					"███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
					"████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
					"██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
					"╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
				["Tuesday"] = {
					"",
					"████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
					"╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
					"   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
					"   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
				["Wednesday"] = {
					"",
					"██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
					"██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
					"██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
					"",
				},
				["Thursday"] = {
					"",
					"████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
					"╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
					"   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ",
					"   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
				["Friday"] = {
					"",
					"███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
					"██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
					"╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
				["Saturday"] = {
					"",
					"███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
					"╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
					"███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
					"╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
				["Sunday"] = {
					"",
					"███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
					"╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
					"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
					"",
				},
			}
		end
		local function week_header(concat)
			local header = {
				[[]],
				[[]],
				[[]],
				[[               ▄█          █          █▄             ]],
				[[             ▐██      ▄█  ███  █▄      ██▌           ]],
				[[            ▐██▌     █████████████     ▐██▌          ]],
				[[            ████    ███████████████     ████         ]],
				[[+----------------------------+--------------------------+]],
			}
			local week = week_ascii_text()
			local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
			local day = daysoftheweek[os.date("*t").wday]
			local tbl = week[day]
			table.insert(tbl, os.date("%Y-%m-%d %H:%M:%S ") .. (concat or ""))
			vim.list_extend(header, tbl)
			table.insert(header, "")
			table.insert(header, "")
			table.insert(header, "")
			return header
		end
		local opts = {
			theme = "doom",
			config = {
				header = week_header([[ [  Github] [version : 2.0.0] ]]),
				center = {
					{
						icon = "    ",
						desc = "Projects                            ",
						action = "Telescope projects",
					},
					{
						icon = "    ",
						desc = "Recently files                      ",
						action = "Telescope oldfiles",
					},
					{
						icon = "    ",
						desc = "Find file                           ",
						action = "Telescope find_files",
					},
					{
						icon = "    ",
						desc = "Ranger                              ",
						action = "RnvimrToggle",
					},
					{
						icon = "    ",
						desc = "Edit keybindings                    ",
						action = "edit ~/.config/nvim/lua/keybindings.lua",
					},
					{
						icon = "    ",
						desc = "Edit Projects                       ",
						action = "edit ~/.local/share/nvim/project_nvim/project_history",
					},
					{
						icon = "    ",
						desc = "Edit .zshrc                        ",
						action = "edit ~/.zshrc",
					},
					{
						icon = "    ",
						desc = "Edit init.lua                       ",
						action = "edit ~/.config/nvim/init.lua",
					},
				},
				footer = {
					"🎉 Knowledge is power",
				},
			},
		}
		return opts
	end,
	config = function(_, opts)
		-- 首页
		local db = require("dashboard")
		-- db.setup(opt)
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local footer = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				opts.config.footer = { "", footer, "" }
				-- print(footer)
				db.setup(opts)
			end,
		})
	end,
}
