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
            { path = "${3rd}/luv/library",      words = { "vim%.uv" } },
            { path = "~/Workspace/git/love2d/", words = { "love" } },
            { path = "LazyVim",                 words = { "LazyVim" } },
            { path = "snacks.nvim",             words = { "Snacks" } },
            { path = "lazy.nvim",               words = { "LazyVim" } },
          },
        },
      },
    },
    config = function()
      -- To instead override globally
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            ---@diagnostic disable-next-line: undefined-field
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

              }
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
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              }
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              enable = false,
            },
            checkOnSave = {
              command = "clippy",
            },
          }
        }
      }
      require 'lspconfig'.clangd.setup {}
      require 'lspconfig'.gopls.setup {}

      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)

      vim.keymap.set("n", "<C-e>", function() vim.diagnostic.open_float({ border = "rounded", focusable = false }) end)

      -- Toggle inlay hint
      vim.keymap.set("n", "<space>le", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle inlay" })


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                vim.diagnostic.show()
              end,
            })
          end
        end,
      })
    end,
  }
}
