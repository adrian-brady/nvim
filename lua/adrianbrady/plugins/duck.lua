return {
	"tamton-aquib/duck.nvim",
	config = function()
		vim.keymap.set("n", "<leader>dd", function()
			require("duck").hatch()
		end, { desc = "duck hatch" })
		vim.keymap.set("n", "<leader>dk", function()
			require("duck").cook()
		end, { desc = "duck cook" })
		vim.keymap.set("n", "<leader>da", function()
			require("duck").cook_all()
		end, { desc = "duck cook all" })
	end,
}
