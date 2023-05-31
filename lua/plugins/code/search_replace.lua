return {
	event = "BufReadPre",
	-- enabled = false,
	"roobert/search-replace.nvim",
	config = function()
		require("search-replace").setup({
			-- optionally override defaults
			default_replace_single_buffer_options = "gcI",
			default_replace_multi_buffer_options = "egcI",
		})
		local keys_table = {
			--选中模式 选中搜索替换 单个缓存区
			{ "<leader>r", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", "v" },
			--正常模式 单个缓冲区搜索替换
			{ "<leader>r", "<CMD>SearchReplaceSingleBufferOpen<CR>" },
			-- 单缓冲区  自动搜索替换当前光标单词
			{ "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>" },
			-- 单缓冲区 自动搜索替换当前光标表达式
			{ "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>" },
			-- 单个缓冲区 自动搜索替换当前光标文件路径
			{ "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>" },
			-- 多缓冲区 自动搜索替换
			{ "<leader>rb", "<CMD>SearchReplaceMultiBufferOpen<CR>" },
		}
		require("utils").K.table_keysbind(keys_table)
		vim.o.inccommand = "split"
	end,
}
