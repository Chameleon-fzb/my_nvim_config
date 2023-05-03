local M = {}
M.Signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
M.DiffIcons = { added = " ", modified = " ", removed = " " }
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

return M
