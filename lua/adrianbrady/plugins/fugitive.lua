return {
  'tpope/vim-fugitive',
  config = function()
    local AJ_Fugitive = vim.api.nvim_create_augroup('AJ_Fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = AJ_Fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end
      end,
    })
    local wk = require 'which-key'

    wk.register {
      ['<leader>g'] = {
        ['g'] = { '<cmd>G<cr>', 'Fugitive menu' },
        ['c'] = { '<cmd>Git commit<cr>', 'Git [C]ommit' },
        ['d'] = { '<cmd>Git diff<cr>', 'Git [D]iff' },
        ['D'] = { '<cmd>Git diff --staged<cr>', 'Git diff --[S]taged' },
        ['l'] = { '<cmd>Git log<cr>', 'Git [L]og' },
        ['o'] = { '<cmd>Git log --oneline --decorate --graph<cr>', 'Git Log --[o]neline' },
        ['b'] = { '<cmd>Git blame<cr>', 'Git [B]lame' },
        ['t'] = { '<cmd>Git push -u origin<cr>', 'Git Push Origin' },
        ['P'] = { '<cmd>Git pull --rebase<cr>', 'Git [P]ull --rebase' },
        ['p'] = { '<cmd>Git pull<cr>', 'Git Push Origin' },
      },
    }
  end,
}
