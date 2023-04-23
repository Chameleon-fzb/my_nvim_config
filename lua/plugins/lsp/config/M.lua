local M = {}
local function r(client)
	return require("plugins.lsp.config." .. client)
end
local myServer = require("plugins.lsp.config.myServer")
for key, value in pairs(myServer) do
	local isNumber = type(key) == "number"
	local server = (isNumber and value) or key
	local disable = (isNumber and false) or value.disable
	if not disable then
		local status, config = pcall(r, server)
		M[server] = (status and config) or {}
	end
end

return M
