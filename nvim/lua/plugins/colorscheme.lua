local normalFg = "#A9B7C6"
local normalBg = "#323131"
local algae = "#698E53"
local chalk = "#B0BDCB"
local tomato = "#ff6347"
local orange = "#D08B1B"
local purple = "#B683C8"
local slate = "#7A9EC2"
local gray = "#737AA2"
local darkGray = "#383838"

return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon", -- "storm", "night", "moon", "day"
    transparent = true, -- Enable/Disable background transparency
    terminal_colors = true,
    styles = {
      comments = { italic = false, fg = "#7ac292" },
      keywords = { italic = false },
      functions = { italic = true, fg = "#d9bc8d" },
      variables = { italic = true },
    },
    on_highlights = function(hl, colors)
      hl["Normal"] = { fg = normalFg, bg = normalBg, bold = false }
      hl["ColorColumn"] = { bg = darkGray }
      hl["CursorLine"] = { bg = darkGray }
      hl["CursorLineNr"] = { fg = tomato }
      hl["Whitespace"] = { fg = normalFg, bg = "#752424" }
      hl["NormalFloat"] = { bg = normalBg, fg = normalFg }
      hl["FloatBorder"] = { bg = normalBg, fg = slate }
      hl["FloatTitle"] = { bg = normalBg, fg = slate }
      hl["@attrbute"] = { fg = purple }
      hl["@constant"] = { fg = chalk }
      hl["@keyword"] = { fg = orange }
      hl["@keyword.async"] = { fg = tomato }
      hl["@keyword.import"] = { fg = orange }
      hl["@keyword.return"] = { fg = tomato }
      hl["@number"] = { fg = slate }
      hl["@operator"] = { fg = chalk }
      hl["@parameter"] = { fg = normalFg }
      hl["@property"] = { fg = purple }
      hl["@punctuation.bracket"] = { fg = "#eae167" }
      hl["@string"] = { fg = algae }
      hl["@type"] = { fg = slate }
      hl["@type.definition"] = { fg = slate }
      hl["@variable"] = { fg = chalk }

      --Typescript
      hl["@variable.member.tsx"] = { fg = purple }
      hl["@tag.tsx"] = { fg = slate }
      hl["@tag.delimiter.tsx"] = { fg = orange }

      -- neo-tree
      hl["NeoTreeNormal"] = { bg = normalBg }
      hl["NeoTreeNormalNC"] = { bg = normalBg }

      -- Telescope
      hl["TelescopeNormal"] = { bg = normalBg, fg = normalFg }
      hl["TelescopeBorder"] = { bg = normalBg, fg = slate }
      hl["TelescopeSelection"] = { bg = "#7f4c00", fg = normalFg }
      hl["TelescopeSelectionCaret"] = { bg = normalBg, fg = orange }
      hl["TelescopePromptNormal"] = { fg = orange }
      hl["TelescopePromptTitle"] = { fg = orange }
      hl["TelescopePromptPrefix"] = { fg = orange }
      hl["TelescopePromptBorder"] = { fg = orange, bg = normalBg }
      -- hl["TelescopePreviewTitle"] = { bg = normalBg }
      -- hl["TelescopePreviewBorder"] = { bg = normalBg }
      -- hl["TelescopeResultsTitle"] = { bg = normalBg }
      -- hl["TelescopeResultsBorder"] = { bg = normalBg, fg = normalFg }

      hl["WhichKeyNormal"] = { bg = normalBg, fg = normalFg }

      if vim.fn.has("nvim-0.10") == 1 then
        hl.LineNrAbove = { fg = gray }
        hl.LineNrBelow = { fg = gray }
      end
    end,
  },
}
