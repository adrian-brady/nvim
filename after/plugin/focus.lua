local wk = require("which-key")
wk.add({
	{
		"<leader>zt",
		function()
			require("focus").toggle({
				window = {
					width = 0.85,
				},
			})
		end,
		desc = "Focus toggle",
	},
	{
		"<leader>zz",
		function()
			require("focus").toggle_zen({
				zen = {
					opts = {
						number = true,
						relativenumber = true,
					},
				},
			})
		end,
		desc = "Toggle zen",
	},
	{
		"<leader>zs",
		function()
			local buf = vim.api.nvim_get_current_buf()
			require("focus").toggle_narrow({
				line1 = vim.api.nvim_buf_get_mark(buf, "<")[1],
				line2 = vim.api.nvim_buf_get_mark(buf, ">")[1],
			})
		end,
		desc = "Toggle narrow [s]election",
	},
})
