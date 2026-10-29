return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    config = function()
      require("onedarkpro").setup({
        highlights = {
          Comment = { italic = true },
          Keyword = { bold = true, italic = true },
          ["@keyword"] = { bold = true, italic = true },
          Function = { bold = true, italic = true },
          ["@function"] = { bold = true, italic = true },
          ["@function.call"] = { bold = true, italic = true },
          Todo = {
            bold = true,
            italic = true,
            fg = "#ffffff",
            bg = "#ff5f5f",
          },

          ["@comment.todo"] = {
            bold = true,
            italic = true,
            fg = "#ffffff",
            bg = "#ff5f5f",
          },
        },
      })
    end,
  },

  {
    "gbprod/nord.nvim",
    lazy = true,
  },
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  {
    "yorumicolors/yorumi.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "bjarneo/nes.nvim",
    lazy = true,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
  },
}
