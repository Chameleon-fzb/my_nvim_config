return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"FelipeLema/cmp-async-path",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local kind_icons = {
			Text = "󰊄",
			Method = "",
			Function = "󰊕",
			Constructor = "⌘",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}
		local cmp = require("cmp")
		cmp.setup({
			-- 注释时禁止lspcmp
			enabled = function()
				local context = require("cmp.config.context")
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			experimental = {
				native_menu = false,
				ghost_text = false,
			},
			mapping = {
				-- 上一个
				["<C-k>"] = cmp.mapping.select_prev_item(),
				-- 下一个
				["<C-j>"] = cmp.mapping.select_next_item(),
				-- 如果窗口内容太多，可以滚动
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				-- 取消
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
				-- 确认
				-- {select = true,behavior = cmp.ConfirmBehavior.Replace,}
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "async_path" },
				{ name = "nvim_lua" },
			}),
			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
		-- / 查找模式使用 buffer 源
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
				{ name = "cmdline_history" },
			},
		})
		-- : 命令行模式中使用 path 和 cmdline 源.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "async_path" },
			}, {
				{ name = "cmdline" },
			}, {
				{ name = "cmdline_history" },
			}),
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- 选择函数或方法自动加()
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		vim.cmd([[
			autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
			set completeopt=menuone,noinsert,noselect
			highlight! default link CmpItemKind CmpItemMenuDefault
			" gray
			highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
			" blue
			highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
			highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
			" light blue
			highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
			highlight! link CmpItemKindInterface CmpItemKindVariable
			highlight! link CmpItemKindText CmpItemKindVariable
			" pink
			highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
			highlight! link CmpItemKindMethod CmpItemKindFunction
			" front
			highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
			highlight! link CmpItemKindProperty CmpItemKindKeyword
			highlight! link CmpItemKindUnit CmpItemKindKeyword
		]])
	end,
}
