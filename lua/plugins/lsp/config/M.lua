local M = {}
-- 诊断icons
M.Signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- 差异 icons
M.DiffIcons = { added = " ", modified = " ", removed = " " }
-- 补全 icons
M.CmpIcons = {
	Text = "󰊄 ",
	Method = " ",
	Function = "󰊕 ",
	Constructor = "⌘ ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
}
-- 增强 lsp 功能的 icons
M.SagaIcons = {
	File = { " ", "Tag" },
	Module = { " ", "Exception" },
	Namespace = { " ", "Include" },
	Package = { " ", "Label" },
	Class = { " ", "Include" },
	Method = { " ", "Function" },
	Property = { " ", "@property" },
	Field = { " ", "@field" },
	Constructor = { " ", "@constructor" },
	Enum = { " ", "@number" },
	Interface = { " ", "Type" },
	Function = { "󰊕 ", "Function" },
	Variable = { " ", "@variable" },
	Constant = { " ", "Constant" },
	String = { "󰅳 ", "String" },
	Number = { "󰎠 ", "Number" },
	Boolean = { " ", "Boolean" },
	Array = { "󰅨 ", "Type" },
	Object = { "󱃖 ", "Type" },
	Key = { " ", "" },
	Null = { "󰟢 ", "Constant" },
	EnumMember = { " ", "Number" },
	Struct = { " ", "Type" },
	Event = { " ", "Constant" },
	Operator = { " ", "Operator" },
	TypeParameter = { " ", "Type" },
	-- ccls
	TypeAlias = { " ", "Type" },
	Parameter = { "  ", "@parameter" },
	StaticMethod = { " ", "Function" },
	Macro = { " ", "Macro" },
	-- for completion sb microsoft!!!
	Text = { "󰊄 ", "String" },
	Snippet = { " ", "@variable" },
	Folder = { " ", "Title" },
	Unit = { " ", "Number" },
	Value = { " ", "@variable" },
}
-- lsp
M.Clients = {}
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
		M.Clients[server] = (status and config) or {}
	end
end
-- 只允许null_ls 接收格式化
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		-- 过滤只有null_ls可以接收格式化请求
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
-- null_ls 格式化
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end
return M
