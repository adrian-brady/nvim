local wk = require("which-key")

wk.add({
	mode = "n",
	icon = "󱅻",
	"<leader>z",
	function()
		require("zen-mode").setup({
			window = {
				width = 90,
				options = {},
			},
		})
		require("zen-mode").toggle()
	end,
	desc = "Zen",
})
