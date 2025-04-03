return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀ᚦ°⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠾⠛⠋⠉⠉⠉⠉⠙⠛⠷⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣠⣴⠟⢁⣠⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣄⠀⠀⠀⠀⠀
  ⠀⠀⠀⢀⣼⠟⠁⣰⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣧⡀⠀⠀⠀
  ⠀⠀⢀⡾⠁⢠⣾⡟⠁⠀⠀⠀⣠⣾⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀
  ⠀⢀⣾⠁⣠⣿⠏⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⣷⡀⠀
  ⠀⢸⡇⠀⣿⠏⠀⠀⢀⣴⣷⡀⠻⣿⣿⣿⣿⠟⢀⣾⣦⡀⠀⠀⠀⠀⠀⢸⡇⠀
  ⠀⢸⡇⠀⠀⠀⠀⠀⢸⣿⣿⣿⣦⣤⠈⠁⣤⣴⣿⣿⣿⡇⠀⠀⠀⢰⠃⢸⡇⠀
  ⠀⠈⢿⡀⠀⠀⠀⠀⠀⠻⠿⡿⠿⠃⠀⠀⠘⠿⢿⠿⠟⠀⠀⠀⡰⠟⢀⡿⠁⠀
  ⠀⠀⠈⢿⣤⡀⠀⣀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣀⠀⢀⣤⡿⠁⠀⠀
  ⠀⠀⠀⠀⠉⠛⠛⠋⣡⣤⣌⠙⠻⠶⣦⣴⠶⠟⠋⣡⣤⣌⠙⠛⠛⠉⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⢀⣴⣶⠄⠠⣶⣦⡀⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⡏⠈⢿⣿⠀⠀⣿⡿⠁⢹⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⠀⠀⠉⠀⠀⠉⠀⠀⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀  ⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { desc = " Find File",        action = 'lua LazyVim.pick()()',                            icon = " ", key = "f" },
          { desc = " New File",         action = "ene | startinsert",                               icon = " ", key = "n" },
          { desc = " Recent Files",     action = 'lua LazyVim.pick("oldfiles")()',                  icon = " ", key = "r" },
          { desc = " Find Text",        action = 'lua LazyVim.pick("live_grep")()',                 icon = " ", key = "g" },
          { desc = " Config",           action = 'lua LazyVim.pick.config_files()()',               icon = " ", key = "c" },
          { desc = " Restore Session",  action = 'lua require("persistence").load()',               icon = " ", key = "s" },
          { desc = " Quit",             action = function() vim.api.nvim_input("<cmd>qa<cr>") end,  icon = " ", key = "q" },
          -- { desc = " Lazy Extras",   action = "LazyExtras",                                      icon = " ", key = "x" },
          -- { desc = " Lazy",          action = "Lazy",                                            icon = "󰒲 ", key = "l" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
