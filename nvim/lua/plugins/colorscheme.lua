local normalFg = "#A9B7C6"
local normalBg = "#383a3a"

local algae = "#7ac292"
local amythist = "#9E69AF" -- constructors
local basil = "#0b8043" -- comments
local chalk = "#B0BDCB" -- variables/idents
local darkGray = "#484848"
local darkOrange = "#C8601B"
local flamingo = "#e67c73" -- errors/operators
local gray = "#737AA2"
local orange = "#D08B1B" -- keywords
local pollen = "#d9bc8d" -- functions/punctuation
local slate = "#7A9EC2" -- types/numbers
local tomato = "#ff6347"
local wisteria = "#b39ddb" -- statements/properties

return {
  "folke/tokyonight.nvim",
  opts = {
    style = "moon",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = false, fg = basil },
      keywords = { italic = false },
      functions = { italic = true, fg = pollen },
      variables = { italic = true },
    },

    on_highlights = function(hl)
      ---------------
      -- Core UI
      ---------------

      hl.Normal = { fg = normalFg, bg = normalBg, bold = false }
      hl.ColorColumn = { bg = darkGray }
      hl.CursorLine = { bg = darkGray }
      hl.CursorLineNr = { fg = flamingo }
      hl.DiagnosticError = { fg = flamingo }
      hl.DiagnosticUnnecessary = { fg = gray }
      hl.FloatBorder = { bg = normalBg, fg = slate }
      hl.FloatTitle = { bg = normalBg, fg = slate }
      hl.NormalFloat = { bg = normalBg, fg = normalFg }
      hl.Statement = { fg = wisteria }
      hl.Whitespace = { fg = gray } -- was very red; keep subtle
      hl.FlashBackdrop = { fg = gray }
      hl.NeoTreeNormal = { bg = normalBg }
      hl.NeoTreeNormalNC = { bg = normalBg }
      hl.WhichKeyNormal = { bg = normalBg, fg = normalFg }
      hl.DiffAdded = { fg = algae }
      hl.DiffRemoved = { fg = tomato }
      hl.DiffChanged = { fg = slate }

      ---------------
      -- Telescope
      ---------------

      hl.TelescopeNormal = { bg = normalBg, fg = normalFg }
      hl.TelescopeBorder = { bg = normalBg, fg = slate }
      hl.TelescopeMatching = { bg = normalBg }
      hl.TelescopePromptBorder = { fg = orange, bg = normalBg }
      hl.TelescopePromptNormal = { fg = orange, bg = normalBg }
      hl.TelescopePromptPrefix = { fg = orange }
      hl.TelescopePromptTitle = { fg = orange }
      hl.TelescopeSelection = { bg = "#7f4c00", fg = normalFg }
      hl.TelescopeSelectionCaret = { bg = normalBg, fg = orange }

      if vim.fn.has("nvim-0.10") == 1 then
        hl["LineNrAbove"] = { fg = gray }
        hl["LineNrBelow"] = { fg = gray }
      end

      ---------------
      -- Syntax
      ---------------

      hl["@attribute"] = { fg = wisteria }
      hl["@constant"] = { fg = chalk }
      hl["@constructor"] = { fg = amythist }
      hl["@keyword"] = { fg = orange }
      hl["@keyword.async"] = { fg = tomato }
      hl["@keyword.import"] = { fg = orange }
      hl["@keyword.return"] = { fg = darkOrange }
      hl["@number"] = { fg = slate }
      hl["@operator"] = { fg = flamingo }
      hl["@parameter"] = { fg = normalFg }
      hl["@property"] = { fg = wisteria }
      hl["@punctuation.bracket"] = { fg = pollen }
      hl["@string"] = { fg = algae }
      hl["@string.escape"] = { fg = flamingo }
      hl["@type"] = { fg = slate }
      hl["@type.definition"] = { fg = slate }
      hl["@variable"] = { fg = chalk }

      ----------------------------------------------------------------
      -- Haskell
      ----------------------------------------------------------------
      hl["@character.haskell"] = { fg = algae }
      hl["@constructor.haskell"] = { fg = amythist, bold = true } -- Data constructors
      hl["@function.call.haskell"] = { fg = pollen }
      hl["@function.haskell"] = { fg = pollen, italic = true }
      hl["@keyword.haskell"] = { fg = orange }
      hl["@keyword.import.haskell"] = { fg = orange }
      hl["@namespace.haskell"] = { fg = wisteria } -- modules
      hl["@operator.haskell"] = { fg = flamingo } -- infix ops, composition, etc.
      hl["@punctuation.bracket.haskell"] = { fg = pollen }
      hl["@string.escape.haskell"] = { fg = flamingo }
      hl["@type.builtin.haskell"] = { fg = slate, italic = true }
      hl["@type.haskell"] = { fg = slate, bold = true }
      hl["@variable.parameter.haskell"] = { fg = normalFg, italic = true }
      hl["@lsp.type.type"] = { fg = slate, bold = true }
      hl["@lsp.type.typeAlias"] = { fg = slate, italic = true }
      hl["@lsp.type.namespace"] = { fg = wisteria } -- module names
      hl["@lsp.type.constructor"] = { fg = amythist, bold = true }
      hl["@lsp.type.function"] = { fg = pollen, italic = true }
      hl["@lsp.type.parameter"] = { fg = normalFg, italic = true }
      hl["@lsp.type.variable"] = { fg = chalk }
      hl["@lsp.type.property"] = { fg = wisteria }
      hl["@lsp.type.enumMember"] = { fg = amythist }
      hl["@lsp.type.keyword"] = { fg = orange }
      hl["@lsp.type.operator"] = { fg = flamingo }
      hl.LspInlayHint = { fg = gray, bg = darkGray, italic = true }

      ---------------
      -- Typescript
      ---------------
      hl["@keyword.coroutine.typescript"] = { fg = darkOrange }
      hl["@lsp.type.interface.typescript"] = { fg = slate }
      hl["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = orange }
      hl["@tag.delimiter.tsx"] = { fg = orange }
      hl["@tag.tsx"] = { fg = slate }
      hl["@variable.member.tsx"] = { fg = wisteria }
    end,
  },
}
