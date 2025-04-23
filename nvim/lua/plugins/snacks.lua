return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>bs",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle scratch buffer",
    },
    {
      "<leader>h",
      function()
        if Snacks.config.picker and Snacks.config.picker.enabled then
          Snacks.picker.notifications()
        else
          Snacks.notifier.show_history()
        end
      end,
      desc = "Notification history",
    },
  },
}
