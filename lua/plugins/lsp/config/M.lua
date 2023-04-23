local M = {}
local function r(client)
	return require("plugins.lsp.config." .. client)
end
local myServer = require("plugins.lsp.config.myServer")
for server, conf in pairs(myServer) do
	local enable = conf.enable or true
	if enable then
		local status, config = pcall(r, server)
		if status then
			M[server] = config
		else
			M[server] = {}
		end
	end
end
-- M.html = r("html")
-- M.cssls = r("cssls")
-- M.cssmodules_ls = r("cssmodules_ls")
-- M.jsonls = r("jsonls")
-- M.lua_ls = r("lua")
-- M.emmet_ls = r("emmet_ls")
-- M.tsserver = r("tsserver")
-- M.gopls = r("gopls")
-- M.volar = r("volar")
-- M.tailwindcss = r("tailwindcss")
-- M.marksman = r("marksman")
-- M.eslint = r('eslint')
return M
