return function(conf)
	local default_events =
		{ "InsertEnter", "InsertLeave", "BufCreate", "BufLeave", "BufEnter", "FocusGained", "Focuslost" }
	local events = conf.events or default_events
	require("utils").autocmd(events, function()
		local input_status = tonumber(vim.fn.system("fcitx5-remote"))
		if input_status == 2 then
			vim.fn.system("fcitx5-remote -c")
		end
	end)
end
