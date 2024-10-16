-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

local opts = {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local wk = require("which-key")
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				sign_priority = 100,
			})

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			local blameLineColor = vim.api.nvim_get_color_by_name("comment")
			vim.api.nvim_set_hl(0, "GitsignsCurrentLineBlame", { fg = blameLineColor })
			local signColumnColor = vim.api.nvim_get_color_by_name("GruvboxBg0")
			vim.api.nvim_set_hl(0, "SignColumn", { fg = signColumnColor })

			-- Navigation
			local function next_hunk()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end

			local function prev_hunk()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end

			wk.add({
				{
					"]c",
					next_hunk(),
					desc = "Jump to next git [c]hange",
				},
				{
					"[c",
					prev_hunk(),
					desc = "Jump to previous git [c]hange",
				},
			})

			-- Actions
			-- visual mode

			wk.add({
				{
					"<leader>hs",
					function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					mode = "v",
					desc = "stage git hunk",
				},
				{
					"<leader>hr",
					function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					mode = "v",
					desc = "stage git hunk",
				},
			})
			-- normal mode
			wk.add({
				{ mode = "n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" } },
				{ mode = "n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" } },
				{ mode = "n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" } },
				{ mode = "n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" } },
				{ mode = "n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" } },
				{ mode = "n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" } },
				{ mode = "n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" } },
				{ mode = "n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" } },
				{
					mode = "n",
					"<leader>hD",
					function()
						gitsigns.diffthis("@")
					end,
					{ desc = "git [D]iff against last commit" },
				},
			})
			-- Toggles
			wk.add({
				{
					mode = "n",
					"<leader>tb",
					gitsigns.toggle_current_line_blame,
					{ desc = "[T]oggle git show [b]lame line" },
				},
				{ mode = "n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" } },
			})
		end,
	},
}

return opts
