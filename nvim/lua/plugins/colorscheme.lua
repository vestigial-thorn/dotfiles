local normalFg = "#A9B7C6"
local normalBg = "#323131"
local algae = "#698E53"
local chalk = "#B0BDCB"
local darkOrange = "#C8601B"
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
      hl["CursorLineNr"] = { fg = darkOrange }
      hl["Whitespace"] = { fg = normalFg, bg = "#752424" }
      hl["@attrbute"] = { fg = purple }
      hl["@constant"] = { fg = chalk }
      hl["@keyword"] = { fg = orange }
      hl["@keyword.async"] = { fg = darkOrange }
      hl["@keyword.import"] = { fg = orange }
      hl["@keyword.return"] = { fg = darkOrange }
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
      -- hl["TelescopeSelectionCaret"] = { bg = normalBg }
      hl["TelescopeMatching"] = { bg = normalBg }
      hl["TelescopeNormal"] = { bg = normalBg, fg = slate }
      -- hl["TelescopePromptNormal"] = { bg = normalBg }
      -- hl["TelescopePromptTitle"] = { bg = normalBg }
      -- hl["TelescopePromptPrefix"] = { bg = normalBg }
      hl["TelescopePromptBorder"] = { fg = orange, bg = normalBg }
      -- hl["TelescopePreviewTitle"] = { bg = normalBg }
      -- hl["TelescopePreviewBorder"] = { bg = normalBg }
      -- hl["TelescopeResultsTitle"] = { bg = normalBg }
      -- hl["TelescopeResultsBorder"] = { bg = normalBg, fg = normalFg }

      if vim.fn.has("nvim-0.10") == 1 then
        hl.LineNrAbove = { fg = gray }

        hl.LineNrBelow = { fg = gray }
      end
    end,
  },
}
