return function()
	require("utils").autocmd({ "BufEnter" }, function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end)
end
