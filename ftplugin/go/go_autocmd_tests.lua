local test_function_query_string = [[
(
 (function_declaration
  name: (identifier) @name
  parameters:
    (parameter_list
     (parameter_declaration
      name: (identifier)
      type: (pointer_type
          (qualified_type
           package: (package_identifier) @_package_name
           name: (type_identifier) @_type_name)))))

 (#eq? @_package_name "testing")
 (#eq? @_type_name "T")
 (#eq? @name "%s")
)
]]

local find_test_line = function(go_bufnr, name)
  local formatted = string.format(test_function_query_string, name)
  print(formatted)
  local query = vim.treesitter.query.parse('go', formatted)
  local parser = vim.treesitter.get_parser(go_bufnr, 'go', {})
  local tree = parser:parse()[1]
  local root = tree:root()

  for id, node in query:iter_captures(root, go_bufnr, 0, -1) do
    if id == 1 then
      local range = { node:range() }
      return range[1]
    end
  end
end

local make_key = function(entry)
  assert(entry.Package, 'Must have Package:' .. vim.inspect(entry))
  assert(entry.Test, 'Must have Test:' .. vim.inspect(entry))
  return string.format('%s/%s', entry.Package, entry.Test)
end

local add_golang_test = function(state, entry)
  state.tests[make_key(entry)] = {
    name = entry.Test,
    line = find_test_line(state.bufnr, entry.Test),
    output = {},
  }
  print('ADD_TEST_LINE=' .. state.tests[make_key(entry)].line)
end

local add_golang_output = function(state, entry)
  assert(state.tests, vim.inspect(state))
  local key = make_key(entry)
  table.insert(state.tests[make_key(entry)].output, vim.trim(entry.Output))
end

local mark_success = function(state, entry)
  state.tests[make_key(entry)].success = entry.Action == 'pass'
end

local ns = vim.api.nvim_create_namespace 'live-tests'
local group = vim.api.nvim_create_augroup('teej-automagic', { clear = true })

local attach_to_buffer = function(bufnr, command)
  state = {
    bufnr = bufnr,
    tests = {},
  }

  vim.api.nvim_create_autocmd('BufWritePost', {

    group = group,
    pattern = '*.go',
    callback = function()
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

      local state = {
        bufnr = bufnr,
        tests = {},
      }

      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if not data then
            return
          end
          for _, line in ipairs(data) do
            print(vim.inspect(line))
          end
          for _, line in ipairs(data) do
            print(line)
            if not (line == '') then
              local decoded = vim.json.decode(line)
              print(vim.inspect(decoded))
              if decoded.Action == 'run' then
                add_golang_test(state, decoded)
              elseif decoded.Action == 'output' then
                if not decoded.Test then
                  goto continue
                end

                add_golang_output(state, decoded)
              elseif decoded.Action == 'pass' or decoded.Action == 'fail' then
                if decoded.Test == nil then
                  goto continue
                end
                mark_success(state, decoded)

                local test = state.tests[make_key(decoded)]
                print(vim.inspect(test))
                if test.success then
                  local text = { '✓ Test Passed' }
                  vim.api.nvim_buf_set_extmark(bufnr, ns, test.line, 0, {
                    virt_text = { text },
                  })
                end
              elseif decoded.Action == 'pause' or decoded.Action == 'cont' or decoded.Action == 'start' or decoded.Action == 'skip' then
              -- Do nothing
              else
                error('Failed to handle' .. vim.inspect(data) .. vim.inspect(decoded))
              end
            end
            ::continue::
          end
        end,
        on_exit = function()
          local failed = {}
          for _, test in pairs(state.tests) do
            print(vim.inspect(test))
            if test.line then
              if not test.success then
                local failure_entry = {
                  bufnr = bufnr,
                  lnum = test.line,
                  col = 0,
                  severity = vim.diagnostic.severity.ERROR,
                  source = 'go-test',
                  user_data = {},
                }
                print('ouptut=' .. vim.inspect(test.output))
                print(test.output[2])
                print(failure_entry.message)
                if test.output then
                  failure_entry.message = 'E: ' .. test.output[2]
                else
                  failure_entry.message = 'Test Failed'
                end
                table.insert(failed, failure_entry)
              end
            end
          end

          vim.diagnostic.set(ns, bufnr, failed, {})
        end,
      })
    end,
  })
end

vim.api.nvim_create_user_command('GoTestOnSave', function()
  local currentFile = vim.fn.expand '%:p:h'
  print(currentFile)
  attach_to_buffer(vim.api.nvim_get_current_buf(), { 'go', 'test', currentFile, '-v', '-json' })
end, {})
