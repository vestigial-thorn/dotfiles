return {
  {
    "olimorris/codecompanion.nvim",
    enabled = function()
      return vim.env.DOT_PROFILE == "thorn"
    end,
    opts = {
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            schema = { model = { default = "gpt-4o-mini" } },
          })
        end,
      },
      strategies = {
        chat = { adapter = "openai", opts = { keymaps = { close = "q" } } },
        inline = { adapter = "openai", opts = { keymaps = { close = "q" } } },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
      { "<leader>aA", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions" },
      { "<leader>ae", "<cmd>CodeCompanionInline<cr>", desc = "AI Edit (Inline)" },
      {
        "<leader>ac",
        function()
          require("cc_rg").ripgrep_context()
        end,
        desc = "AI Add Context (ripgrep)",
      },
      {
        "<leader>aR",
        function()
          require("cc_rg").ripgrep_selection()
        end,
        mode = "v",
        desc = "AI: rg selection",
      },
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)

      -- --- ripgrep helpers
      local M = {}

      -- best-effort project root (git > lsp > cwd)
      local function root_dir()
        local git = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if git and git ~= "" then
          return git
        end
        for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
          if client.config and client.config.root_dir then
            return client.config.root_dir
          end
        end
        return (vim.uv or vim.loop).cwd()
      end

      local function run_rg(query)
        if not query or query == "" then
          return "No query provided."
        end
        local cmd = {
          "rg",
          "-n",
          "-S",
          "--hidden",
          "--trim",
          "--color",
          "never",
          "--glob",
          "!.git",
          "--glob",
          "!node_modules",
          "--glob",
          "!dist",
          "--glob",
          "!build",
          "--glob",
          "!.next",
          query,
          ".",
        }
        local result = vim.system(cmd, { cwd = root_dir(), text = true }):wait()
        local out = (result.stdout or ""):gsub("\r\n", "\n")
        if out == "" then
          out = "(no matches)"
        end
        -- Lightly cap very large outputs
        local lines = {}
        local count = 0
        for line in out:gmatch("([^\n]*)\n?") do
          if line == "" and out == "(no matches)" then
            break
          end
          count = count + 1
          if count > 800 then
            table.insert(lines, "... (truncated)")
            break
          end
          table.insert(lines, line)
        end
        return table.concat({
          "### ripgrep context",
          "",
          "```text",
          table.concat(lines, "\n"),
          "```",
          "",
        }, "\n")
      end

      -- Insert text into current buffer (chat buffer recommended)
      local function insert_text_block(block)
        local row = vim.api.nvim_win_get_cursor(0)[1]
        local lines = {}
        for s in block:gmatch("([^\n]*)\n?") do
          table.insert(lines, s)
        end
        vim.api.nvim_buf_set_lines(0, row, row, false, lines)
      end

      function M.ripgrep_context()
        local q = vim.fn.input("ripgrep query: ")
        insert_text_block(run_rg(q))
      end

      function M.ripgrep_selection()
        local sel = vim.fn.getreg("v")
        if not sel or sel == "" then
          -- fallback: yank visual selection into "v"
          vim.cmd([[normal! "vy]])
          sel = vim.fn.getreg("v")
        end
        insert_text_block(run_rg(sel))
      end

      package.loaded["cc_rg"] = M
    end,
  },
}
