return {
  "saghen/blink.cmp",
  dependencies = { "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" },
  opts = {
    keymap = {
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    signature = { enabled = true },
    completion = {
      menu = {
        -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDoc,CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          components = {
            kind = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "text",
                  })
                end

                return icon .. ctx.icon_gap
              end,
            },
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    sources = {
      per_filetype = {
        cs = { "snippets", "lsp", "path", "buffer" },
      },
      providers = {
        snippets = {
          score_offset = 10,
        },
      },
    },
  },
}
