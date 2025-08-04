return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = { blink_cmp = true },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "deeper-night",
    },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Your configuration options here.
      theme = {
        transparent = true,
      },
    },
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_background = true,
        disable_float_background = true,
      })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      vim.cmd("colorscheme poimandres")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyTransparent = true
    end,
  },
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {transparent  = true}, -- Add custom configuration here
  config = function(_, opts)
    require("nightfall").setup(opts)
  end,
},
}
