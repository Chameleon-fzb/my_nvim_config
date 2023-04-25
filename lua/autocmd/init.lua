local opts = require("autocmd.options")
local function loadCmd(cmd, conf)
	require("autocmd." .. cmd)(conf)
end
for cmd, opt in pairs(opts) do
	local isTable = type(opt) == "table"
	local enable = (opt and isTable and opt.enable) or opt
	local conf = (opt and isTable and opt.config) or {}
	if enable then
		loadCmd(cmd, conf)
	end
end
