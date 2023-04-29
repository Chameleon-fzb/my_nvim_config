--浮动终端
return {
	"numToStr/FTerm.nvim",
	event = "VeryLazy",
	keys = {
		{ "<A-i>", "<cmd>lua require('FTerm').toggle()<cr>" },
		{ "<A-i>", mode = { "t" }, "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>" },
		{ "yb", "<cmd>YarnBuild<cr>" },
		{ "<A-g>", mode = { "t" }, "<C-\\><C-n>lua gitui:toggle()" },
	},
	command = { "YarnBuild", "GitCommit" },
	config = function()
		local FTerm = require("FTerm")
		FTerm.setup({
			dimensions = {
				height = 0.6,
				width = 0.6,
			},
		})

		local gitui = FTerm:new({
			ft = "FTerm_gitui", -- You can also override the default filetype, if you want
			cmd = "gitui",
			dimensions = {
				height = 0.8,
				width = 0.8,
			},
		})
		-- Use this to toggle gitui in a floating terminal
		vim.keymap.set("n", "<A-g>", function()
			gitui:toggle()
		end)
		vim.api.nvim_create_user_command("Gitui", function()
			FTerm.scratch({ cmd = "gitui" })
		end, { bang = true })
		vim.api.nvim_create_user_command("YarnBuild", function()
			FTerm.scratch({ cmd = { "yarn", "build" } })
		end, { bang = true })
		vim.api.nvim_create_user_command("GitCommit", function()
			local Input = require("nui.input")
			local event = require("nui.utils.autocmd").event
			local create_input = function(title, prompt, on_close, on_submit)
				return Input({
					position = "50%",
					size = {
						width = 60,
					},
					border = {
						style = "single",
						text = {
							top = title,
							top_align = "center",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:Normal",
					},
				}, {
					prompt = prompt,
					default_value = "",
					on_close = on_close,
					on_submit = on_submit,
				})
			end
			local git_add_src = create_input("[Git-add-src]", "addSrc >", function()
				print("Input add src closed!")
			end, function(src)
				local git_commit_msg = create_input("[Git-commit-msg]", "commitMsg >", function()
					print("Input commit msg closed!")
				end, function(msg)
					FTerm.run({ "gitcommit " .. src .. " '" .. msg .. "'" })
					FTerm.toggle()
					print("End of git Commit")
				end)
				git_commit_msg:mount()
				git_commit_msg:on(event.BufLeave, function()
					git_commit_msg:unmount()
				end)
			end)
			git_add_src:mount()
			git_add_src:on(event.BufLeave, function()
				git_add_src:unmount()
			end)
		end, { bang = true })
	end,
}
