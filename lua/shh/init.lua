local M = {}

function M.my_fold_expr()
	local text = vim.treesitter.foldtext()
end

function M.greet()
	print("Hello from local plug")
end

return M
