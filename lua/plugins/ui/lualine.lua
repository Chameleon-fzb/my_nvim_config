-- 底部栏
return {
	"nvim-lualine/lualine.nvim",
	event = { "BufNewFile", "BufReadPre" },
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	opts = function()
		local Signs = require("plugins.lsp.config.M").Signs
		local DiffIcons = require("plugins.lsp.config.M").DiffIcons
		return {
			options = {
				theme = "onenord",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "dashboard" },
			},
			extensions = { "nvim-tree" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = DiffIcons,
					},
					{
						"diagnostics",
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = Signs.Error, warn = Signs.Warn, info = Signs.Info, hint = Signs.Hint },
						colored = true,
						update_in_insert = true,
						always_visible = true,
					},
				},
				lualine_c = {
					{
						"filetype",
						color = { fg = "#88c0d0" },
					},
					{
						"filename",
						color = { fg = "#d08f70" },
					},
				},
				lualine_x = {
					{
						function()
							return require("noice").api.status.command.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
						color = { fg = "#a3be8c" },
					},
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
						color = { fg = "#a3be8c" },
					},

					{
						"progress",
						color = { fg = "#d08f70" },
					},
					{
						"filesize",
						color = { fg = "#88c0d0" },
					},
				},
				lualine_y = {
					{
						"datetime",
						style = "󱑎 " .. "%Y-%m-%d %H:%M:%S",
						color = { fg = "#a3be8c" },
					},
					{
						"encoding",
						color = { fg = "#d08f70" },
					},
					{
						"fileformat",
						symbols = {
							unix = " Arch",
							dos = " Win",
							mac = " Mac",
						},
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					"location",
				},
			},
		}
	end,
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
