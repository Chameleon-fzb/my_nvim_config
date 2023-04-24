-- vim.cmd([[
-- let g:input_toggle = 1
-- function! Fcitx2en()
--    let s:input_status = system("fcitx5-remote")
--    if s:input_status == 2
--       let g:input_toggle = 1
--       let l:a = system("fcitx5-remote -c")
--    endif
-- endfunction
--
-- function! Fcitx2zh()
--    let s:input_status = system("fcitx5-remote")
--    if s:input_status != 2
--       let l:a = system("fcitx5-remote -o")
--       let g:input_toggle = 0
--    endif
-- endfunction
-- autocmd InsertLeave * call Fcitx2en()
-- autocmd InsertEnter * call Fcitx2en()
-- autocmd BufCreate *  call Fcitx2en()
-- autocmd BufEnter *   call Fcitx2en()
-- autocmd BufLeave * call Fcitx2en()
-- ]])
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "BufCreate", "BufLeave", "BufEnter" }, {
	pattern = "*",
	callback = function()
		local input_status = tonumber(vim.fn.system("fcitx5-remote"))
		if input_status == 2 then
			vim.fn.system("fcitx5-remote -c")
		end
	end,
})
