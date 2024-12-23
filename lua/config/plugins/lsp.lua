return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library",                       words = { "vim%.uv" } },
            { path = "~/Workspace/git/love2d/", words = { "love" } },
            { path = "LazyVim",                                  words = { "LazyVim" } },
            { path = "snacks.nvim",                              words = { "Snacks" } },
            { path = "lazy.nvim",                                words = { "LazyVim" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
      require 'lspconfig'.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            }
          }
        }
      }
      require 'lspconfig'.clangd.setup {}
      require 'lspconfig'.gopls.setup {}

      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)

      --   vim.api.nvim_create_autocmd('LspAttach', {
      --     callback = function(args)
      --       local client = vim.lsp.get_client_by_id(args.data.client_id)
      --       if not client then return end
      --
      --       ---@diagnostic disable-next-line: missing-parameter
      --       if client.supports_method('textDocument/formatting') then
      --         vim.api.nvim_create_autocmd('BufWritePre', {
      --           buffer = args.buf,
      --           callback = function()
      --             vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      --           end,
      --         })
      --       end
      --     end,
      --   })
    end,
  }
}
