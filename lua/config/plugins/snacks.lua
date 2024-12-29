return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      animate = { enabled = true },
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        config = function()
          ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
          local progress = vim.defaulttable()
          vim.api.nvim_create_autocmd("LspProgress", {
            ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
            callback = function(ev)
              local client = vim.lsp.get_client_by_id(ev.data.client_id)
              local value = ev.data.params
              .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
              if not client or type(value) ~= "table" then
                return
              end
              local p = progress[client.id]

              for i = 1, #p + 1 do
                if i == #p + 1 or p[i].token == ev.data.params.token then
                  p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                      value.kind == "end" and 100 or value.percentage or 100,
                      value.title or "",
                      value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                  }
                  break
                end
              end

              local msg = {} ---@type string[]
              progress[client.id] = vim.tbl_filter(function(v)
                return table.insert(msg, v.msg) or not v.done
              end, p)

              local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
              vim.notify(table.concat(msg, "\n"), "info", {
                id = "lsp_progress",
                title = client.name,
                opts = function(notif)
                  notif.icon = #progress[client.id] == 0 and " "
                      or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                end,
              })
            end,
          })
        end
      },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      ---@class snack.zen.Config
      zen = {
        enabled = true,
        config = function()
          vim.keymap.set("n", "<space>z", require("snacks").zen.zen)
          vim.keymap.set("n", "<space>Z", require("snacks").zen.zoom)
        end,
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          inlay_hints = false,
        },
        show = {
          statusline = false,
          tabline = false,
        },
        win = { style = "zen" },
        zoom = {
          toggles = {},
          show = { statusline = true, tabline = true },
          win = {
            backdrop = false,
            width = 0, -- full width
          }
        }
      }
    }
  }
}
