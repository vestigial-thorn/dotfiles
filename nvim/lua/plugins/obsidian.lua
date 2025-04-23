return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required.
  },
  opts = {
    -- for a full list of options: https://github.com/epwalsh/obsidian.nvim
    workspaces = {
      {
        name = "convergence",
        path = "~/vaults",
      },
      {
        name = "plane",
        path = "~/Source/plane/docs/",
      },
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y.%m.%d",
      default_tags = { "daily" },
      template = "daily",
    },
    new_notes_location = "undigested",
  },

  -- see below for full list of options 👇
}
