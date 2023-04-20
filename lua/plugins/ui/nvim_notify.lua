return {
	"rcarriga/nvim-notify",
	lazy = true,
	opts = {
		-- "fade", "slide", "fade_in_slide_out", "static"
		stages = "slide",
		timeout = 2000,
		fps = 30,
		mmax_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)

		vim.notify = notify
		require("telescope").load_extension("notify")
	end,
}
