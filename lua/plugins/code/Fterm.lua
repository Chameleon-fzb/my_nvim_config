--浮动终端
return {
	"numToStr/FTerm.nvim",
	event = "VeryLazy",
	keys = {
		{ "<A-i>", "<cmd>lua require('FTerm').toggle()<cr>" },
		{ "<A-i>", mode = { "t" }, "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>" },
		{ "yb", "<cmd>YarnBuild<cr>" },
	},
	command = { "YarnBuild", "GitPush" },
	config = function()
		require("FTerm").setup({
			-- border = "double",
			dimensions = {
				height = 0.6,
				width = 0.6,
			},
		})
		vim.api.nvim_create_user_command("YarnBuild", function()
			require("FTerm").scratch({ cmd = { "yarn", "build" } })
		end, { bang = true })
		vim.api.nvim_create_user_command("GitPush", function()
			-- local buf = vim.api.nvim_buf_get_name(0)
			-- local ftype = vim.filetype.match({ filename = buf })
			local Input = require("nui.input")
			local event = require("nui.utils.autocmd").event

			local input = Input({
				position = "50%",
				size = {
					width = 60,
				},
				border = {
					style = "single",
					text = {
						top = "[Commit Msg]",
						top_align = "center",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			}, {
				prompt = "commitMsg > ",
				default_value = "",
				on_close = function()
					print("Input Closed!")
				end,
				on_submit = function(value)
					require("FTerm").run({ "git add ./", "\n git commit -m '" .. value .. "'" })
					-- require("FTerm").scratch({ cmd = { "git", "commit", "-m", value } })
					require("FTerm").toggle()
				end,
			})

			-- mount/open the component
			input:mount()

			-- unmount component when cursor leaves buffer
			input:on(event.BufLeave, function()
				input:unmount()
			end) -- vim.api.nvim_command(":")
			-- local commitText
		end, { bang = true })
	end,
}
