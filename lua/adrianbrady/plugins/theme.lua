return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 10000, -- Make sure to load this before all the other start plugins.
		config = function()
			-- vim.cmd("set termguicolors")
			-- vim.g.gruvbox_material_enable_italic = true
			vim.cmd.colorscheme("tokyonight")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			--
			-- vim.api.nvim_set_hl(0, "DiagnosticSignOk", { link = "DiagnosticOK" })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
			-- vim.cmd.hi("Comment gui=none")

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

			-- You can configure highlights by doing something like:
		end,
	},
}
