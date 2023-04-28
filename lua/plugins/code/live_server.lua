-- liveServer
return {
	"aurum77/live-server.nvim",
	build = function()
		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	opts = {
		port = 8080,
		quiet = false,
		no_css_inject = true, -- Disables css injection if true, might be useful when testing out tailwindcss
	},
}
