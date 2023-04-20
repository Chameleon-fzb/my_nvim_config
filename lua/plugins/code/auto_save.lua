--代码自动保存
return {
	"okuuva/auto-save.nvim",
	event = "BufRead",
	opts = {
		{
			-- ,"BufLeave" "InsertLeave","TextChanged" , "TextChanged"
			trigger_events = {
				immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
				defer_save = { "InsertLeave" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
				cancel_defered_save = { "InsertEnter", "TextChanged" }, -- vim events that cancel a pending deferred save
			},
			debounce_delay = 1000,
		},
	},
}
