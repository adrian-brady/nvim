return {
	"daliusd/ghlite.nvim",
	config = function()
		require("ghlite").setup({
			debug = false, -- if set to true debugging information is written to ~/.ghlite.log file
			view_split = "vsplit", -- set to empty string '' to open in active buffer
			diff_split = "vsplit", -- set to empty string '' to open in active buffer
			comment_split = "split", -- set to empty string '' to open in active buffer
			open_command = "open", -- open command to use, e.g. on Linux you might want to use xdg-open
			merge = {
				approved = "--squash",
				nonapproved = "--auto --squash",
			},
			html_comments_command = { "lynx", "-stdin", "-dump" }, -- command to render HTML comments in PR view
			-- override default keymaps with the ones you prefer
			-- set keymap to false or '' to disable it
			keymaps = {
				diff = {
					open_file = "gf",
					open_file_tab = "",
					open_file_split = "o",
					open_file_vsplit = "O",
					approve = "ca",
				},
				comment = {
					send_comment = "c<CR>", -- this one cannot be disabled
				},
				pr = {
					approve = "ca",
					merge = "cm",
					comment = "cc",
					diff = "cp",
				},
			},
		})
	end,
	keys = {
		{ "<leader>us", ":GHLitePRSelect<cr>", silent = true },
		{ "<leader>uo", ":GHLitePRCheckout<cr>", silent = true },
		{ "<leader>uv", ":GHLitePRView<cr>", silent = true },
		{ "<leader>uu", ":GHLitePRLoadComments<cr>", silent = true },
		{ "<leader>up", ":GHLitePRDiff<cr>", silent = true },
		{ "<leader>ul", ":GHLitePRDiffview<cr>", silent = true },
		{ "<leader>ua", ":GHLitePRAddComment<cr>", silent = true },
		{ "<leader>ua", ":GHLitePRAddComment<cr>", mode = "v", silent = true },
		{ "<leader>uc", ":GHLitePRUpdateComment<cr>", silent = true },
		{ "<leader>ud", ":GHLitePRDeleteComment<cr>", silent = true },
		{ "<leader>ug", ":GHLitePROpenComment<cr>", silent = true },
	},
}
