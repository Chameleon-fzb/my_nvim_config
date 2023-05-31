local i = "i"
local v = "v"
local t = "t"
local n = "n"
return {
	-- 强制退出
	{ "Q", "<cmd>qa!<cr>" },
	-- 保存并退出vim
	{ "<leader>q", "<cmd>wq<cr>" },
	-- 退出当前模式
	{ "jk", "<esc>", { i, v } },
	-- 保存 n v i 模式下保存
	{ "<C-s>", ":w<CR>", { i, v, n } },
	-- 使用 <A-U> 将光标所在单词转化为全大写
	{ "<A-U>", "<esc>viwUwa", i },
	{ "<leader-U>", "<esc>viwUwa", i },
	-- 使用 <A-u> 将光标所在单词转化为全小写
	{ "<A-u>", "<esc>viwuwa", i },
	{ "<leader-u>", "<esc>viwuwa", i },

	-- 取消 s 默认功能
	{ "s", "" },
	-- windows 分屏快捷键 分屏会计
	{ "sv", ":vsp<CR>" },
	{ "sh", ":sp<CR>" },
	-- 关闭当前
	{ "sc", "<C-w>q" },
	-- 关闭其他
	{ "so", "<C-w>o" },
	-- Alt + hjkl  窗口之间跳转
	{ "<A-h>", "<C-w>h" },
	{ "<A-j>", "<C-w>j" },
	{ "<A-k>", "<C-w>k" },
	{ "<A-l>", "<C-w>l" },
	-- 左右比例控制
	{ "<C-Left>", ":vertical resize -2<CR>" },
	{ "<C-Right>", ":vertical resize +2<CR>" },
	{ "s,", ":vertical resize -20<CR>" },
	{ "s.", ":vertical resize +20<CR>" },
	-- 上下比例
	{ "sj", ":resize +10<CR>" },
	{ "sk", ":resize -10<CR>" },
	{ "<C-Down>", ":resize +2<CR>" },
	{ "<C-Up>", ":resize -2<CR>" },
	-- 等比例
	{ "s=", "<C-w>=" },
	-- Terminal相关
	{ "<leader>t", ":sp | terminal<CR>" },
	{ "<leader>vt", ":vsp | terminal<CR>" },
	{ "<leader>jk", "<C-\\><C-n>", t },
	{ "<A-h>", [[ <C-\><C-N><C-w>h ]], t },
	{ "<A-j>", [[ <C-\><C-N><C-w>j ]], t },
	{ "<A-k>", [[ <C-\><C-N><C-w>k ]], t },
	{ "<A-l>", [[ <C-\><C-N><C-w>l ]], t },
	-- visual模式下缩进代码
	{ "<", "<gv", v },
	{ ">", ">gv", v },
	-- 上下移动选中文本
	{ "J", ":move '>+1<CR>gv-gv", v },
	{ "K", ":move '<-2<CR>gv-gv", v },
	-- 选中单词
	{ "w", "aw", v },
	-- 选中一个段落
	{ "s", "as", v },
	-- 选中一行
	{ "r", "<esc>0vg_", v },
	{ "<enter><enter>", "v<esc>0vg_", { n, i } },
	-- 正常模式下yy复制会复制换行符,取消复制换行符
	-- n("yy", "0vg_y<esc>")
	-- insert 模式下，跳到行首行尾
	{ "<C-h>", "<esc>I", i },
	{ "<C-l>", "<esc>A", i },
	-- n 模式下 跳到行首行尾
	{ "<C-h>", "^" },
	{ "<C-l>", "$" },
	-- 在visual 模式里粘贴不要复制
	{ "p", '"_dP', v },
}
