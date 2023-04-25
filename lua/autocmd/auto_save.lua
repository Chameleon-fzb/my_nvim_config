return function(conf)
	local delay = conf.save_delay or 1000
	local events = conf.events or { "InsertLeave", "TextChanged" }
	vim.api.nvim_create_autocmd(events, {
		pattern = { "*" },
		callback = function()
			local timer = vim.loop.new_timer()
			timer:start(
				delay,
				0,
				vim.schedule_wrap(function()
					vim.cmd("silent! wall")
				end)
			)
		end,
		nested = true,
	})
end
