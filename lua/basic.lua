local opt = vim.opt
local g = vim.g
g.encoding = "UTF-8"
opt.fileencoding = "utf-8"
opt.autowrite = true -- 启用自动写入
-- 样式
opt.background = "dark" --dark light
-- 真色支持
opt.termguicolors = true
-- 禁止折行
opt.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
opt.whichwrap = "<,>,[,]"
-- 补全增强
opt.wildmenu = true
-- 自动补全不自动选中
-- g.completeopt = "menu,menuone,noselect,noinsert"
opt.completeopt = "menu,menuone,noselect"
-- 补全最多显示10行
opt.pumblend = 10 -- 弹出混合
opt.pumheight = 10 -- 弹出窗口中的最大条目数
-- 永远显示 tabline
opt.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
opt.showmode = false
opt.ttimeoutlen = 100
g.loaded_perl_provider = 0
opt.splitbelow = true -- 将新窗口置于当前窗口之下
opt.splitright = true -- 将新窗口放在当前窗口的右边
-- jkhl 移动时光标周围保留8行
opt.scrolloff = 4
opt.sidescrolloff = 8
-- 使用相对行号
opt.number = true
opt.relativenumber = true
-- 高亮所在行
opt.cursorline = true
-- 显示左侧图标指示列
opt.signcolumn = "yes"
opt.textwidth = 120
-- 空格替代tab
opt.expandtab = true
-- 缩进2个空格等于一个Tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true
-- 缩进的大小
opt.shiftwidth = 2
opt.smartindent = true -- 自动插入缩进
opt.syntax = "enable" --开启代码高亮
-- 按键 前缀 空格
g.mapleader = " "
g.maplocalleader = " "
-- 在退出修改缓冲区之前确认保存更改
opt.confirm = true
-- 鼠标支持
opt.mouse = "a"
--鼠标事件
opt.mousemoveevent = true
-- smaller updatetime
opt.updatetime = 100
-- 设置 timeoutlen 为等待键盘快捷键连击时间300毫秒，可根据需要设置
opt.timeoutlen = 300
-- 搜索大小写不敏感，除非包含大写
opt.ignorecase = true
opt.smartcase = true
-- 不可见字符的显示
-- vim.opt.nolist = false
opt.list = false
opt.shortmess:append({ W = true, I = true, c = true })
-- Dont' pass messages to |ins-completin menu|
-- vim.opt.shortmess = vim.opt.shortmess .. "c"
-- 新行对齐当前行
opt.autoindent = true
opt.smartindent = true
-- 边输入边搜索
opt.incsearch = true
-- 当文件被外部程序修改时，自动加载
opt.autoread = true
-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false
--剪贴板
-- vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
opt.clipboard = "unnamedplus"
opt.splitkeep = "screen" --决定打开、关闭或调整横向分割的尺寸时的滚动行 文本保持在相同屏幕行。
--可撤销的最大次数
opt.undolevels = 10000
--自动保存撤销历史
opt.undofile = true
--命令行的补全模式
opt.wildmode = "longest:full,full"
-- Fix markdown indentation settings
g.markdown_recommended_style = 0

local Signs = require("plugins.lsp.config.M").Signs
for type, icon in pairs(Signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
