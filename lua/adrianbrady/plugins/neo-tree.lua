-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
		{ "<leader>pt", ":Neotree position=current<CR>", { desc = "Neotree" } },
		{ "<leader>pg", ":Neotree float git_status<CR>", { desc = "Neotree Git Status" } },
	},
	opts = {
		default_component_configs = {
			git_status = {
				symbols = {
					added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "D", -- this can only be used in the git_status source
					renamed = "r", -- this can only be used in the git_status source
					-- Status type
					untracked = "?",
					ignored = "-",
					unstaged = "M",
					staged = "M",
					conflict = "!",
				},
			},
		},
		filesystem = {
			window = {
				width = 24,
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
