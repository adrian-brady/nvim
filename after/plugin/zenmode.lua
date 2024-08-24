vim.keymap.set('n', '<leader>z', function()
  require('zen-mode').setup {
    window = {
      width = 90,
      options = {},
    },
  }
  require('zen-mode').toggle()
end, { desc = 'Zen' })
