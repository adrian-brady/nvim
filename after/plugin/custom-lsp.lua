local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

if not configs.educationalsp then
  configs.educationalsp = {
    default_config = {
      cmd = { '/Users/adrianbrady/Workspace/Projects/educationalsp/main' },
      root_dir = lspconfig.util.root_pattern '.git',
      filetypes = { 'asm' },
    },
  }
end
lspconfig.educationalsp.setup {}
