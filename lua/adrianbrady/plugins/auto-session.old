return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		function()
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end,
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
}
