local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon [A]dd' })
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<C-j>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<C-n>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<C-u>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<C-q>', function()
  harpoon:list():select(4)
end)

vim.keymap.set('n', '<C-;>', function()
  harpoon:list():select(5)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)

vim.keymap.set('n', '<C-x>', function()
  harpoon:list():remove()
end)
