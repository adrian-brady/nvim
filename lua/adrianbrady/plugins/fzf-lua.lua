local maps = function()
	local wk = require("which-key")
	local fzf = require("fzf-lua")
	wk.add({
		{
			mode = "n",
			desc = "[S]earch",
			"<leader>f",
			{
				"<leader>st",
				desc = "[S]earch [T]reesitter",
				function()
					fzf.treesitter()
				end,
			},
			{
				"<leader><leader>",
				desc = "Search Buffers",
				function()
					fzf.buffers()
				end,
			},
			{
				"<leader>sf",
				desc = "[S]earch [F]iles",
				function()
					fzf.files()
				end,
			},
			{
				"<leader>sm",
				desc = "[S]earch [M]anpages",
				function()
					fzf.manpages()
				end,
			},
			{
				"<leader>s'",
				desc = "[S]earch Marks",
				function()
					fzf.marks()
				end,
			},
			{
				"<leader>sh",
				desc = "[S]earch [H]elptags",
				function()
					fzf.helptags()
				end,
			},
			{
				"<leader>sr",
				desc = "[S]earch g[R]ep Project",
				function()
					fzf.grep_project()
				end,
			},
			{
				"<leader>sa",
				desc = "[S]earch code [A]ctions",
				function()
					fzf.lsp_code_actions()
				end,
			},
			{
				{
					"<leader>sd",
					desc = "[S]earch [d]eclarations",
					function()
						fzf.lsp_declarations()
					end,
				},
				{
					"<leader>sD",
					desc = "[S]earch [D]efinitions",
					function()
						fzf.lsp_definitions()
					end,
				},
				{
					{
						"<leader>ws",
						desc = "Workspace Symbols",
						function()
							fzf.lsp_workspace_symbols()
						end,
					},
					{
						"<leader>ds",
						desc = "Document Symbols",
						function()
							fzf.lsp_document_symbols()
						end,
					},
				},
				{
					"<leader>x",
					desc = "Diagnostics",
					{
						"<leader>xw",
						desc = "Workspace Diagnostics",
						function()
							fzf.diagnostics_document()
						end,
					},
					{
						"<leader>xd",
						desc = "Document Diagnostics",
						function()
							fzf.dianostics_workspace()
						end,
					},
				},
			},
			{
				"<leader>sg",
				desc = "[S]earch [G]it",
				{
					"<leader>sgf",
					desc = "[S]earch [G]it [F]iles",
					function()
						fzf.git_files()
					end,
				},
				{
					"<leader>sgc",
					desc = "[S]earch [G]it [C]ommits",
					function()
						fzf.git_commits()
					end,
				},
				{
					"<leader>sgb",
					desc = "[S]earch [G]it [B]ranches",
					function()
						fzf.git_branches()
					end,
				},
				{
					"<leader>sgs",
					desc = "[S]earch [G]it [S]atus",
					function()
						fzf.git_status()
					end,
				},
				{
					"<leader>sgl",
					desc = "[S]earch [G]it buffer [L]og",
					function()
						fzf.bcommits()
					end,
				},
			},
		},
	})
end

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({})
		maps()
	end,
}
