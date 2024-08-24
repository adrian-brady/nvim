return {
  -- Lua
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
      tmux = { enabled = true },
      gitsigns = { enabled = true },
      wezterm = {
        enabled = true,
        font = '+4',
      },
    },
  },
}
