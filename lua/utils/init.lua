local U = {}
-- 合并表
U.tableMerge = function(...)
	return vim.tbl_deep_extend("force", ...)
end
-- 遍历目录
U.traverseDir = function(path)
	local file_table = {}
	local files = vim.fs.dir(vim.fs.normalize(path))
	for file in files do
		file = vim.split(file, ".lua")[1]
		table.insert(file_table, file)
	end
	return file_table
end
-- 自动命令
U.autocmd = function(events, callback)
	vim.api.nvim_create_autocmd(events, {
		pattern = "*",
		callback = callback,
	})
end
U.K = require("utils.keymap")
return U
