local normalFg = "#A9B7C6"
local normalBg = "#383a3a"

local algae = "#7ac292"
local amythist = "#9E69AF"
local basil = "#0b8043"
local chalk = "#B0BDCB"
local darkGray = "#484848"
local darkOrange = "#C8601B"
local flamingo = "#e67c73"
local gray = "#737AA2"
local orange = "#D08B1B"
local pollen = "#d9bc8d"
local slate = "#7A9EC2"
local tomato = "#ff6347"
local wisteria = "#b39ddb"

return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon", -- "storm", "night", "moon", "day"
    transparent = true, -- Enable/Disable background transparency
    terminal_colors = true,
    styles = {
      comments = { italic = false, fg = basil },
      keywords = { italic = false },
      functions = { italic = true, fg = pollen },
      variables = { italic = true },
    },

    on_highlights = function(hl)
      hl["Normal"] = { fg = normalFg, bg = normalBg, bold = false }
      hl["ColorColumn"] = { bg = darkGray }
      hl["CursorLine"] = { bg = darkGray }
      hl["CursorLineNr"] = { fg = flamingo }
      hl["DiagnosticError"] = { fg = flamingo }
      hl["DiagnosticUnnecessary"] = { fg = gray }
      hl["FloatBorder"] = { bg = normalBg, fg = slate }
      hl["FloatTitle"] = { bg = normalBg, fg = slate }
      hl["NormalFloat"] = { bg = normalBg, fg = normalFg }
      hl["Statement"] = { fg = wisteria }
      hl["Whitespace"] = { fg = normalFg, bg = "#752424" }
      hl["FlashBackdrop"] = { fg = gray }
      hl["NeoTreeNormal"] = { bg = normalBg }
      hl["NeoTreeNormalNC"] = { bg = normalBg }
      hl["TelescopeNormal"] = { bg = normalBg, fg = normalFg }
      hl["TelescopeBorder"] = { bg = normalBg, fg = slate }
      hl["TelescopeMatching"] = { bg = normalBg }
      hl["TelescopeNormal"] = { bg = normalBg, fg = slate }
      hl["TelescopePromptBorder"] = { fg = orange, bg = normalBg }
      hl["TelescopePromptNormal"] = { fg = orange }
      hl["TelescopePromptPrefix"] = { fg = orange }
      hl["TelescopePromptTitle"] = { fg = orange }
      hl["TelescopeSelection"] = { bg = "#7f4c00", fg = normalFg }
      hl["TelescopeSelectionCaret"] = { bg = normalBg, fg = orange }
      hl["WhichKeyNormal"] = { bg = normalBg, fg = normalFg }
      hl["DiffAdded"] = { bg = algae, fg = algae }
      hl["DiffRemoved"] = { bg = tomato, fg = tomato }
      hl["DiffChanged"] = { bg = slate, fg = slate }

      if vim.fn.has("nvim-0.10") == 1 then
        hl["LineNrAbove"] = { fg = gray }
        hl["LineNrBelow"] = { fg = gray }
      end

      ---------------
      -- Syntax
      ---------------

      hl["@attrbute"] = { fg = wisteria }
      hl["@constant"] = { fg = chalk }
      hl["@keyword"] = { fg = orange }
      hl["@keyword.async"] = { fg = tomato }
      hl["@keyword.import"] = { fg = orange }
      hl["@keyword.return"] = { fg = darkOrange }
      hl["@number"] = { fg = slate }
      hl["@parameter"] = { fg = normalFg }
      hl["@property"] = { fg = wisteria }
      hl["@punctuation.bracket"] = { fg = pollen }
      hl["@string"] = { fg = algae }
      hl["@type"] = { fg = slate }
      hl["@type.definition"] = { fg = slate }
      hl["@variable"] = { fg = chalk }
      hl["@constructor"] = { fg = amythist }

      --Typescript
      hl["@keyword.coroutine.typescript"] = { fg = darkOrange }
      hl["@lsp.type.interface.typescript"] = { fg = slate }
      hl["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = orange }
      hl["@tag.delimiter.tsx"] = { fg = orange }
      hl["@tag.tsx"] = { fg = slate }
      hl["@variable.member.tsx"] = { fg = wisteria }
    end,
  },
}
