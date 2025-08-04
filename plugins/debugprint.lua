return {
  "andrewferrier/debugprint.nvim",

  config = function()
    -- Unity-aware debugprint function
    local function cs(opts)
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      for _, line in ipairs(lines) do
        line = line:match("^%s*(.-)%s*$") -- trim whitespace
        if line:match("^using%s+UnityEngine") then
          return {
            left = 'Debug.Log($"',
            right = '");',
            mid_var = "{",
            right_var = '}");',
          }
        -- we only search continuous using package section, ignore empty line
        elseif line ~= "" and not line:match("^using%s+") then
          break
        end
      end
      return opts
    end

    require("debugprint").setup({
      filetypes = { ["cs"] = cs },
    })
  end,

  dependencies = {
    -- "echasnovski/mini.nvim",         -- Optional: Needed for line highlighting (full mini.nvim plugin)
    -- ... or ...
    "echasnovski/mini.hipatterns", -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)

    -- "ibhagwan/fzf-lua",              -- Optional: If you want to use the `:Debugprint search` command with fzf-lua
    "nvim-telescope/telescope.nvim", -- Optional: If you want to use the `:Debugprint search` command with telescope.nvim
    -- "folke/snacks.nvim",             -- Optional: If you want to use the `:Debugprint search` command with snacks.nvim
  },

  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
}
