return {
	"cdmill/focus.nvim",
	cmd = { "Focus", "Zen", "Narrow" },

	opts = {
		border = "none",
		zindex = 40, -- zindex of the focus window. Should be less than 50, which is the float default
		window = {
			backdrop = 0.9, -- shade the backdrop of the focus window. Set to 1 to keep the same as Normal
			-- height and width can be:
			-- * an absolute number of cells when > 1
			-- * a percentage of the width / height of the editor when <= 1
			width = 120, -- width of the focus window
			height = 1, -- height of the focus window
			-- by default, no options are changed in for the focus window
			-- add any vim.wo options you want to apply
			options = {},
		},
		auto_zen = false, -- auto enable zen mode when entering focus mode
		-- by default, the options below are disabled for zen mode
		zen = {
			opts = {
				cmdheight = 0, -- disable cmdline
				cursorline = false, -- disable cursorline
				laststatus = 0, -- disable statusline
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				foldcolumn = "0", -- disable fold column
				signcolumn = "no", -- disable signcolumn
				statuscolumn = " ", -- disable status column
			},
			diagnostics = false, -- disables diagnostics
		},
		plugins = {
			-- uncomment any of the lines below to disable that option in Focus mode
			options = {
				ruler = false,
			},
			-- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = true }, -- disables git signs
			-- tmux = { enabled = false }, -- disables the tmux statusline
			-- diagnostics = { enabled = false }, -- disables diagnostics
			-- todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
		},
	},
}
