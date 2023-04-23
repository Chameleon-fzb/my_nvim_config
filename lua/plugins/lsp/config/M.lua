local M = {}
function r(client)
	return require("plugins.lsp.config." .. client)
end

M.html = r("html")
M.cssls = r("css")
M.cssmodules_ls = r("cssmodules_ls")
M.jsonls = r("json")
M.lua_ls = r("lua")
M.emmet_ls = r("emmet_ls")
M.ts = r("typescript")
M.gopls = r("go")
M.volar = r("vue")
M.tailwindcss = r("tailwindcss")
-- M.eslint = r('eslint')
return M
