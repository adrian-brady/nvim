return {
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			local wk = require("which-key")
			wk.add({
				{ "<leader>c", desc = "[C]ode" },
				{ "<leader>d", desc = "[D]ocument" },
				{ "<leader>r", desc = "[R]ename" },
				{ "<leader>s", desc = "[S]earch" },
				{ "<leader>w", desc = "[W]orkspace" },
				{ "<leader>t", desc = "[T]oggle" },
				{ "<leader>h", desc = "Git [H]unk", mode = { "n", "v" } },
				{ "<leader>g", desc = "[G]it" },
			})
		end,
	},
}
