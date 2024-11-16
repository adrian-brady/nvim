--- @param parser (string)
local function printNodes(parser)
	print("=== " .. parser .. " ===")
	local buf = vim.api.nvim_get_current_buf()
	local lang_tree = vim.treesitter.get_parser(buf, parser)
	local tree = lang_tree:parse()[1]
	local root = tree:root()

	local function print_nodes(node)
		for child in node:iter_children() do
			print(child:type())
			print_nodes(child)
		end
	end

	print_nodes(root)
end

vim.api.nvim_create_user_command("PrintTSNodes", function()
	printNodes("markdown")
	printNodes("markdown_inline")
	printNodes("latex")
end, {})
