return {
	"folke/trouble.nvim",
	branch = "dev", -- IMPORTANT!
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>x",
				icon = "󰔫",
				mode = "n",
				desc = "Trouble diagnostics",
			},
			{
				mode = "n",
				group = "diagnostics",
				{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		})
	end,
	opts = {}, -- for default options, refer to the configuration section for custom setup.
}
