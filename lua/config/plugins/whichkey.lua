return {
  "folke/which-key.nvim",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  }
}
