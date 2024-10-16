local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

local wk = require("which-key")
wk.add({
	{
		mode = "n",
		{
			"<leader>a",
			icon = "󰛢",
			group = "Harpoon [A]dd",
			function()
				harpoon:list():add()
			end,
			desc = "Harpoon [A]dd",
		},
		{
			"<C-e>",
			group = "Harpoon",
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon [M]enu",
		},
		{
			"<C-j>",
			function()
				harpoon:list():select(1)
			end,
			desc = "Harpoon select 1",
		},
		{
			"<C-n>",
			function()
				harpoon:list():select(2)
			end,
			desc = "Harpoon select 2",
		},
		{
			"<C-i>",
			function()
				harpoon:list():select(3)
			end,
			desc = "Harpoon select 3",
		},
		{
			"<C-q>",
			function()
				harpoon:list():select(4)
			end,
			desc = "Harpoon select 4",
		},
		{
			"<C-;>",
			function()
				harpoon:list():select(5)
			end,
			desc = "Harpoon select 5",
		},
		{
			"<C-S-P>",
			function()
				harpoon:list():prev()
			end,
			desc = "Harpoon select 5",
		},
		{
			"<C-S-N>",
			function()
				harpoon:list():next()
			end,
			desc = "Harpoon select 5",
		},
		{
			"<C-x>",
			function()
				harpoon:list():remove()
			end,
			desc = "Harpoon Delete",
		},
	},
})
