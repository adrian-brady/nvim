local update_with_command = function(bufnr, pattern, command)
  local append_data = function(_, data)
    if data then
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { pattern .. ' output:' })
  vim.fn.jobstart(command, {
    stdout_buffered = true,
    on_stdout = append_data,
    on_stderr = append_data,
  })
end

local attach_to_buffer = function(bufnr, pattern, command)
  print(bufnr .. pattern .. command)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('aj-auto', { clear = true }),
    pattern = pattern,
    callback = function()
      update_with_command(bufnr, pattern, command)
    end,
  })
end

vim.api.nvim_create_user_command('GoTestStart', function()
  print 'GoTest started'
  local bufnr = vim.api.nvim_create_buf(true, true)
  local splits = vim.split(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), '/')
  local pattern = splits[#splits]
  local parentDir = splits[#splits - 1]
  local command = 'go test ./' .. parentDir
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_open_win(bufnr, true, {
    relative = 'win',
    width = 10,
    height = 10,
    border = 'single',
    win = 1001,
    row = 12,
    col = 12,
  })
  attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

vim.api.nvim_create_user_command('GoTestStop', function()
  vim.api.nvim_create_augroup('aj-auto', { clear = true })
end, {})
