-- Default Lazyvim keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local defaultOpts = { noremap = true, silent = true }

local function keymap(mode, keys, action, opts)
  return vim.api.nvim_set_keymap(mode, keys, action, opts or defaultOpts)
end

local function unmap(mode, keys)
  return vim.api.nvim_del_keymap(mode, keys)
end

local function mapLeader(keys, action, desc, mode)
  return keymap(mode or "n", ("<leader>" .. keys), action, { desc = desc, noremap = true, silent = true })
end

local function unmapLeader(keys, mode)
  return unmap(mode or "n", ("<leader>" .. keys))
end

local function cmd(command)
  return (":" .. command .. "<CR>")
end

mapLeader("v", "<C-j>", ":m .+1<CR>==gv") -- move selection up; keep selected
mapLeader("v", "<C-k>", ":m .-2<CR>==gv") -- move selection down; keep selected
keymap("n", "<leader>.", "@:", { desc = "Repeat command" })

-- buffers
unmapLeader("bd")
unmapLeader("bD")
mapLeader("bk", cmd("b#"), "Kill buffer")
mapLeader("bK", cmd("bd"), "Kill buffer and window")

--code
keymap("n", "<C-.>", cmd("lua vim.lsp.buf.code_action()"), { desc = "Code actions" })

-- files
mapLeader("fw", cmd("write"), "Save file")
mapLeader("F", cmd("Telescope find_files"), "Find files")

-- git
mapLeader("gg", cmd("vert Gitsigns diffthis HEAD"), "Diff this")
mapLeader("gs", cmd("Gitsigns stage_hunk"), "Stage hunk")
mapLeader("gr", cmd("Gitsigns reset_hunk"), "Reset hunk")

-- ui
Snacks.toggle.zen():map("z")

--windows
unmapLeader("wd")
mapLeader("wk", cmd("q"), "Kill window")
