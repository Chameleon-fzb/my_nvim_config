local M = {}
function r(client)
	return require("plugins.lsp.config.".. client)
end

M.html = r("html")
M.css = r("css")
M.json = r("json")
M.lua = r("lua")
M.emmet_ls = r("emmet_ls")
M.ts = r("typescript")
M.go = r("go")
-- M.eslint = r('eslint')
return M
