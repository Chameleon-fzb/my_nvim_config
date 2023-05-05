return function(conf)
	local delay = conf.save_delay or 1000
	local events = conf.events or { "InsertLeave", "TextChanged" }
	local timer = false
	local clear_timer = function() end
	if timer then
		vim.loop.timer_stop(timer)
		timer = false
	end
	vim.api.nvim_create_autocmd(events, {
		pattern = { "*" },
		callback = function()
			clear_timer()
			timer = vim.loop.new_timer()
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
	vim.api.nvim_create_autocmd("InsertEnter", {
		pattern = { "*" },
		callback = clear_timer,
	})
end
