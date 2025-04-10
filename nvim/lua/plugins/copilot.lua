return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "CopilotC-Nvim/CopilotChat.nvim", -- Add CopilotChat plugin
  },
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    require("CopilotChat").setup() -- Ensure CopilotChat is set up
  end,
}
