return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "[D]iffview[O]pen" } },
		{ "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "[D]iffview[C]lose" } },
		{ "<leader>dh", "<cmd>DiffviewClose<CR>", { desc = "[D]iffviewFile[H]istory" } },
	},
	opts = {
		hooks = {
			diff_buf_read = function()
				-- Change local options in diff buffers
				vim.opt_local.wrap = false
				vim.opt_local.list = false
				vim.opt_local.colorcolumn = { 80 }
			end,
		}, -- See |diffview-config-hooks|
	},
}
