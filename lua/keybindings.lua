local opt = {
	noremap = true,
	silent = true,
}
local map = vim.api.nvim_set_keymap
--插入模式
local i = function(keys, action)
	map("i", keys, action, opt)
end
-- 正常模式
local n = function(keys, action)
	map("n", keys, action, opt)
end
-- 终端模式
local t = function(keys, action)
	map("t", keys, action, opt)
end
-- 视图模式
local v = function(keys, action)
	map("v", keys, action, opt)
end
-- 全绑定 n i v
local e = "<esc>"
local all = function(keys, action, exclude)
	if exclude ~= "n" then
		n(keys, action)
	end
	if exclude ~= "i" then
		i(keys, e .. action)
	end
	if exclude ~= "v" then
		v(keys, e .. action)
	end
end
-- 有用的绑定
-- 退出
-- n("q", ":q<CR>")
-- n("<C-q>", ":q!<CR>")
n("Q", ":qa!<CR>")
-- 退出当前模式
all("jk", "<esc>", "n")
-- 保存 n v i 模式下保存
all("<C-s>", ":w<CR>")
-- 使用 <A-U> 将光标所在单词转化为全大写
i("<A-U>", "<esc>viwUwa")
i("<leader-U>", "<esc>viwUwa")
-- 使用 <A-u> 将光标所在单词转化为全小写
i("<A-u>", "<esc>viwuwa")
i("<leader-u>", "<esc>viwuwa")
-- 取消 s 默认功能
n("s", "")
-- windows 分屏快捷键 分屏会计
n("sv", ":vsp<CR>")
n("sh", ":sp<CR>")
-- 关闭当前
n("sc", "<C-w>q")
-- 关闭其他
n("so", "<C-w>o")
-- Alt + hjkl  窗口之间跳转
n("<A-h>", "<C-w>h")
n("<A-j>", "<C-w>j")
n("<A-k>", "<C-w>k")
n("<A-l>", "<C-w>l")
-- 左右比例控制
n("<C-Left>", ":vertical resize -2<CR>")
n("<C-Right>", ":vertical resize +2<CR>")
n("s,", ":vertical resize -20<CR>")
n("s.", ":vertical resize +20<CR>")
-- 上下比例
n("sj", ":resize +10<CR>")
n("sk", ":resize -10<CR>")
n("<C-Down>", ":resize +2<CR>")
n("<C-Up>", ":resize -2<CR>")
-- 等比例
n("s=", "<C-w>=")
-- Terminal相关
n("<leader>t", ":sp | terminal<CR>")
n("<leader>vt", ":vsp | terminal<CR>")
t("<leader>jk", "<C-\\><C-n>")
t("<A-h>", [[ <C-\><C-N><C-w>h ]])
t("<A-j>", [[ <C-\><C-N><C-w>j ]])
t("<A-k>", [[ <C-\><C-N><C-w>k ]])
t("<A-l>", [[ <C-\><C-N><C-w>l ]])

-- visual模式下缩进代码
v("<", "<gv")
v(">", ">gv")
-- 上下移动选中文本
v("J", ":move '>+1<CR>gv-gv")
v("K", ":move '<-2<CR>gv-gv")
-- 选中单词
v("w", "aw")
-- 选中一个段落
v("s", "as")
-- 选中一行
v("r", "<esc>0vg_")
all("<enter><enter>", "v<esc>0vg_", "v")
-- 正常模式下yy复制会复制换行符,取消复制换行符
-- n("yy", "0vg_y<esc>")
-- insert 模式下，跳到行首行尾
i("<C-h>", e .. "I")
i("<C-l>", e .. "A")
-- n 模式下 跳到行首行尾
n("<C-h>", "^")
n("<C-l>", "$")

-- 在visual 模式里粘贴不要复制
v("p", '"_dP')

function vim.fn.ExecuteMacroOverVisualRange()
	vim.api.nvim_echo({ { "@" .. vim.fn.getcmdline() } }, false, {})
	vim.fn.execute(":'<,'>normal @" .. vim.fn.nr2char(vim.fn.getchar()))
end

local function Microcmd(cmd_string)
	return (":<C-u>%s<CR>"):format(cmd_string)
end
local micro = Microcmd("lua vim.fn.ExecuteMacroOverVisualRange()")
map("x", "@", micro, opt)
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide(dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		["<esc>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}
return pluginKeys
-------------------------------
