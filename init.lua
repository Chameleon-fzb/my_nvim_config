-- 基础设置
-- if vim.g.vscode then
-- VSCode extension
-- else
-- ordinary Neovim
-- end
require("basic")
--lazy
-- require("plugins")
require("pluginsInit")
-- require("neovide")
-- auto转换 输入法
require("autocmd")
-- 快捷键映射
require("keybindings")
-- 插件配置
--  local pConfig = "plugin-config"
--  local ui = pConfig .. ".ui"
--  local code = pConfig .. ".code"
--  local files = pConfig .. ".files"
-- require("impatient")
-- require("impatient").enable_profile()
-- require(ui)
-- require(files)
-- require(code)
-- LSP配置
-- require("lsp.setup")
