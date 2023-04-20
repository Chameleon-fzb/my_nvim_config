-- 底部栏
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	opts = {
		options = {
			theme = "onenord",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			--     section_separators = { left = '', right = '' },
			--   component_separators = { left = '', right = '' }
			disabled_filetypes = { "dashboard" },
		},

		extensions = { "nvim-tree" },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				"filename",
			},
			lualine_x = {
				"filesize",
				{
					"fileformat",
					symbols = {
						unix = "", -- e712
						dos = "", -- e70f
						mac = "", -- e711
					},
				},
				"encoding",
				"filetype",
			},
		},
	},
	config = function(_, opts)
		opts.sections.lualine_c = {
			"filename",
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
		}
		require("lualine").setup(opts)
	end,
}
