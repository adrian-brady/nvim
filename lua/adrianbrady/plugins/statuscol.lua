return {
	"luukvbaal/statuscol.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "SignColumn", {})
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			-- configuration goes here, for example:
			relculright = true,
			segments = {
				{
					sign = { name = { "Diagnostic" }, maxwidth = 1, auto = false },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa", auto = false },
				{
					sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = false, wrap = true },
					click = "v:lua.ScSa",
				},
				{
					sign = { namespace = { "gitsign" }, colwidth = 1, wrap = true },
					click = "v:lua.ScSa",
					auto = false,
				},
			},
		})
	end,
}
