local wk = require("which-key")
wk.add({
	"<leader>u",
	desc = "Undotree Toggle",
	mode = "n",
	icon = "󰙅",
	"<cmd>vim.cmd.UndotreeToggle<cr>",
})
