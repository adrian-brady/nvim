return {
	"tpope/vim-fugitive",
	config = function()
		local AJ_Fugitive = vim.api.nvim_create_augroup("AJ_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = AJ_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end
			end,
		})
		local wk = require("which-key")

		wk.add({
			{
				"<leader>g",
				desc = "Git Fugitive",
				icon = "󰊢",
			},
			{
				{ "<leader>gD", "<cmd>Git diff --staged<cr>", desc = "Git diff --[S]taged" },
				{ "<leader>gP", "<cmd>Git pull --rebase<cr>", desc = "Git [P]ull --rebase" },
				{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git [B]lame" },
				{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git [C]ommit" },
				{ "<leader>gd", "<cmd>Git diff<cr>", desc = "Git [D]iff" },
				{ "<leader>gg", "<cmd>G<cr>", desc = "Fugitive menu" },
				-- { "<leader>gl", "<cmd>Git log<cr>", desc = "Git [L]og" },
				-- { "<leader>go", "<cmd>Git log --oneline --decorate --graph<cr>", desc = "Git Log --[o]neline" },
				{ "<leader>gp", "<cmd>Git pull<cr>", desc = "Git Push Origin" },
				{ "<leader>gt", "<cmd>Git push -u origin<cr>", desc = "Git Push Origin" },
			},
		})
	end,
}
