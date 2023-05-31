local multi = require("utils").K.multi

function vim.fn.ExecuteMacroOverVisualRange()
	vim.api.nvim_echo({ { "@" .. vim.fn.getcmdline() } }, false, {})
	vim.fn.execute(":'<,'>normal @" .. vim.fn.nr2char(vim.fn.getchar()))
end

local function Microcmd(cmd_string)
	return (":<C-u>%s<CR>"):format(cmd_string)
end
local micro = Microcmd("lua vim.fn.ExecuteMacroOverVisualRange()")
multi({ "x" }, "@", micro)
