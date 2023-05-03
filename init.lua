-- 基础设置
-- if vim.g.vscode then
-- VSCode extension
-- else
-- ordinary Neovim
-- end
require("basic")
--lazy
require("pluginsInit")
-- require("neovide")
-- auto转换 输入法
require("autocmd")
-- 快捷键映射
require("keybindings")
