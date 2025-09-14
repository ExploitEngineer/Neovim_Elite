return {
  -- Themes you want installed
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "olimorris/onedarkpro.nvim", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },

  -- Configure your default colorscheme here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },

  -- Optional: Example setup for a theme (Tokyonight)
  -- Only needed if you want to customize it.
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      -- transparent = true, -- <== comment this so background is NOT transparent
      on_colors = function(colors)
        -- colors.bg = "#000000" -- uncomment to force black background
      end,
      on_highlights = function(hl, c)
        -- you can override specific highlights here if you want
      end,
    },
  },
}
