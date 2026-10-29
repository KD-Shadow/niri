-- aether.lua
return {
  {
    "bjarneo/aether.nvim",
    enabled = false,
    name = "aether",
    priority = 1000,
    lazy = true,
    opts = function()
      -- Read current rice
      local rice_file = io.open(os.getenv("HOME") .. "/.config/bspwm/.rice", "r")
      local rice = rice_file and rice_file:read("*l") or "isabel"
      if rice_file then
        rice_file:close()
      end

      local themes = {
        isabel = {
          base00 = "#14171c",
          base01 = "#181b21",
          base02 = "#5c6370",
          base03 = "#5c6370",
          base04 = "#abb2bf",
          base05 = "#abb2bf",
          base06 = "#b8bfe5",
          base07 = "#b8bfe5",
          base08 = "#be5046",
          base09 = "#d19a66",
          base0A = "#e5c07b",
          base0B = "#98c379",
          base0C = "#56b6c2",
          base0D = "#61afef",
          base0E = "#8677cf",
          base0F = "#be5046",
        },
        z0mbi3 = {
          base00 = "#0d0f18",
          base01 = "#3d414f",
          base02 = "#3d414f",
          base03 = "#a5b6cf",
          base04 = "#a5b6cf",
          base05 = "#cbced3",
          base06 = "#cbced3",
          base07 = "#cbced3",
          base08 = "#dd6777",
          base09 = "#ecd3a0",
          base0A = "#ecd3a0",
          base0B = "#90ceaa",
          base0C = "#93cee9",
          base0D = "#86aaec",
          base0E = "#6B3FA0",
          base0F = "#dd6777",
        },
        osaka = {
          base00 = "#111c18",
          base01 = "#23372B",
          base02 = "#53685B",
          base03 = "#53685B",
          base04 = "#75bbb3",
          base05 = "#C1C497",
          base06 = "#ACD4CF",
          base07 = "#ffffff",
          base08 = "#FF5345",
          base09 = "#db9f9c",
          base0A = "#E5C736",
          base0B = "#549e6a",
          base0C = "#2DD5B7",
          base0D = "#509475",
          base0E = "#D2689C",
          base0F = "#53685B",
        },
        velvet = {
          -- Monotone shades (base00-base07)
          base00 = "#0a101f", -- Default background
          base01 = "#a88525", -- Lighter background (status bars)
          base02 = "#0a101f", -- Selection background
          base03 = "#6B72A8", -- Comments, invisibles
          base04 = "#6CB6FF", -- Dark foreground
          base05 = "#C7D3E0", -- Default foreground
          base06 = "#C7D3E0", -- Light foreground
          base07 = "#e7eaef", -- Light background

          -- Accent colors (base08-base0F)
          base08 = "#918151", -- Variables, errors, red
          base09 = "#e2687c", -- Integers, constants, orange
          base0A = "#e5af1b", -- Classes, types, yellow
          base0B = "#DC9B68", -- Strings, green
          base0C = "#F5ECDF", -- Support, regex, cyan
          base0D = "#C24F40", -- Functions, keywords, blue
          base0E = "#ff6bf5", -- Keywords, storage, magenta
          base0F = "#f0d17c", -- Deprecated, brown/yellow
        },
        darker = {
          base00 = "#282828", -- bg
          base01 = "#303030", -- lighter bg (statusline, etc)
          base02 = "#3d3d3d", -- selection bg
          base03 = "#585858", -- comments
          base04 = "#6b6b6b", -- dark fg
          base05 = "#8b8b8b", -- fg (main text)
          base06 = "#a8a8a8", -- light fg
          base07 = "#c0c0c0", -- brightest fg
          base08 = "#cf6a6a", -- red — errors, deletions
          base09 = "#c49a6a", -- orange — numbers, constants
          base0A = "#b8a150", -- yellow — classes, warnings
          base0B = "#7a9e7a", -- green — strings
          base0C = "#6a9fa8", -- cyan — support, builtins
          base0D = "#8eaacc", -- blue — functions
          base0E = "#c076c5", -- magenta — keywords (your purple)
          base0F = "#9e6a6a", -- brown — deprecated, special
        },
        white = {
          base00 = "#242422", -- bg
          base01 = "#2e2e2c", -- darker surface
          base02 = "#3a3a38", -- selection
          base03 = "#4a4a47", -- comments
          base04 = "#747687", -- dark fg (line numbers)
          base05 = "#d9d2c0", -- default fg
          base06 = "#e4e0cf", -- light fg
          base07 = "#edead7", -- brightest fg
          base08 = "#794a48", -- red (variables)
          base09 = "#9e6a48", -- orange (integers)
          base0A = "#9e8a6a", -- yellow (classes)
          base0B = "#5a6b5a", -- green (strings)
          base0C = "#5a7a7a", -- cyan (escape chars)
          base0D = "#747687", -- blue (functions)
          base0E = "#8a5a6a", -- magenta (keywords)
          base0F = "#6a5a48", -- brown (deprecated)
        },
        purple = {
          base00 = "#0d0d0d", -- bg
          base01 = "#1a1a1a", -- black
          base02 = "#2a2a2a", -- blue
          base03 = "#3a3a3a", -- green
          base04 = "#444444", -- blueb
          base05 = "#c9c9c9", -- fg
          base06 = "#e0e0e0", -- whiteb
          base07 = "#ffffff", -- brightest (slightly extended)

          base08 = "#8b0000", -- red
          base09 = "#b22222", -- redb
          base0A = "#6b2020", -- yellow
          base0B = "#a8a8a8", -- greenb
          base0C = "#4a1a1a", -- cyan
          base0D = "#6b0f0f", -- magenta
          base0E = "#9b1515", -- magentab
          base0F = "#6b2525", -- cyanb
        },
      }

      local colors = themes[rice] or themes.isabel

      return {
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        lualine_bold = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = true, bold = true },
          functions = { bold = true },
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        colors = colors,
        on_colors = function(c)
          c.hint = c.base0C
          c.error = c.base08
        end,
        on_highlights = function(hl, c)
          hl.Comment = { fg = c.base03, italic = true }
          hl.Function = { fg = c.base0D, bold = true }
          hl.Keyword = { fg = c.base0E, italic = true, bold = true }
        end,
        cache = true,
        plugins = {
          all = package.loaded.lazy == nil,
          auto = true,
        },
      }
    end,
  },
}
