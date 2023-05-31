local map = vim.api.nvim_set_keymap
local mapSet = vim.keymap.set
local K = {}
-- vim.keymap.set
K.mapSet = function(mode, key, action, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	options = require("utils").tableMerge(options, opts or {})
	mapSet(mode, key, action, options)
end
-- 绑定vim.api.nvim_set_keymap
K.map = function(mode, key, cmd, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	options = require("utils").tableMerge(options, opts or {})
	map(mode, key, cmd, options)
end
--普通模式
K.n = function(key, cmd, opts)
	K.map("n", key, cmd, opts)
end
-- 插入模式
K.i = function(key, cmd, opts)
	K.map("i", key, cmd, opts)
end
-- 选中模式
K.v = function(key, cmd, opts)
	K.map("v", key, cmd, opts)
end
-- 终端模式
K.t = function(key, cmd, opts)
	K.map("t", key, cmd, opts)
end
-- 全模式绑定
K.all = function(key, cmd, exclude, opts)
	local modes = { "n", "v", "i" }
	for _, mode in pairs(modes) do
		local isExc = vim.tbl_contains(exclude or {}, mode)
		if not isExc then
			local command = mode == "n" and cmd or "<esc>" .. cmd
			K.map(mode, key, command, opts)
		end
	end
end
-- 多模式绑定
K.multi = function(modes, key, cmd, opts)
	local isIncludeNormal = vim.tbl_contains(modes, "n")
	for _, mode in pairs(modes) do
		local command = (isIncludeNormal and mode == "n") and cmd or "<esc>" .. cmd
		K.mapSet(mode, key, command, opts)
	end
end
--{{modes,key,cmd},{modes,key,cmd},{modes,key,cmd}}
K.table_keysbind = function(keysTable)
	for _, conf in pairs(keysTable) do
		local modes = conf.modes or conf[3] or "n"
		local key = conf.key or conf[1]
		local cmd = conf.cmd or conf[2]
		local opts = conf.opts or conf[4] or {}
		if type(modes) == "string" then
			K.mapSet(modes, key, cmd, opts)
		else
			K.multi(modes, key, cmd, opts)
		end
	end
end
return K
