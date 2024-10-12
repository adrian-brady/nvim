local cfg = {
	configurations = {
		-- C lang configurations
		c = {
			{
				name = "Launch debugger",
				type = "lldb",
				request = "launch",
				cwd = "${workspaceFolder}",
				program = function()
					-- Build with debug symbols
					local out = vim.fn.system({ "make", "debug" })
					-- Check for errors
					if vim.v.shell_error ~= 0 then
						vim.notify(out, vim.log.levels.ERROR)
						return nil
					end
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		},
	},
}

require("dap-lldb").setup(cfg)
