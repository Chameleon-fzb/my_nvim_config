local pluginkeys = {}
local pluginKeysFiles = require("utils").traverseDir("~/.config/nvim/lua/keybindings/pluginkeys")
for _, file in pairs(pluginKeysFiles) do
	if not (file == "init") then
		pluginkeys[file] = require("keybindings.pluginkeys." .. file)
		vim.notify(file)
	end
end

return pluginkeys
