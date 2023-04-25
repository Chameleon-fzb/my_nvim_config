return function()
	if not vim.g.neovide then
		return
	end
	-- 字体
	vim.o.guifont = "Source Code Pro Semibold:h11,HarmonyOs Sans SC:h11:b"
	-- 刷新率
	vim.g.neovide_refresh_rate = 60
	-- 空闲刷新率
	vim.g.neovide_refresh_rate_idle = 5
	-- 透明
	vim.g.neovide_transparency = 0.95
	-- 浮动模糊
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- 滚动动画长度
	--滚动动画长度
	vim.g.neovide_scroll_animation_length = 0.3

	-- 无空闲
	-- vim.g.neovide_no_idle=v:true
	--记住窗口的大小
	-- vim.g.neovide_remember_window_size = 'v:true'
	-- 光标完成动画的时间
	vim.g.neovide_cursor_animation_length = 0.05
	-- 动画轨迹大小
	vim.g.neovide_cursor_trail_size = 0.8
	-- 粒子
	vim.g.neovide_cursor_vfx_mode = "railgun"
	-- 粒子不透明
	vim.g.neovide_cursor_vfx_opacity = 200.0
	-- 粒子寿命
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
end
