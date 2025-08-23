-- Default Lazyvim keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local wk = require("which-key")
local defaultOpts = { noremap = true, silent = true }

local function addGroup(keys, groupTitle)
  wk.add({ ("<leader>" .. keys), group = groupTitle })
end

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

keymap("n", "<leader>.", "@:", { desc = "Repeat command" })
keymap("n", "g<C-d>", ":vsplit<CR>gd", { desc = "Goto definition in new split", silent = true })

mapLeader("sx", cmd("nohlsearch"), "Remove search highlighting")

-- # normal mode
-- ai
addGroup("a", "ai")

-- buffers
unmapLeader("bd")
unmapLeader("bD")
mapLeader("bk", cmd("b#"), "Kill buffer")
mapLeader("bK", cmd("bd"), "Kill buffer and window")

--code
keymap("n", "<C-.>", cmd("lua vim.lsp.buf.code_action()"), { desc = "Code actions" })

-- files
mapLeader("fw", cmd("write"), "Save file")
mapLeader("fv", cmd("vert new"), "New file")
mapLeader("F", cmd("Telescope find_files"), "Find files")

-- git
mapLeader("gg", cmd("vert Gitsigns diffthis HEAD"), "Diff this")
mapLeader("gs", cmd("Gitsigns stage_hunk"), "Stage hunk")
mapLeader("gS", cmd("Gitsigns stage_buffer"), "Stage buffer")
mapLeader("gu", cmd("Gitsigns unstage_hunk"), "Unstage hunk")
mapLeader("gU", cmd("Gitsigns unstage_buffer"), "Unstage buffer")

-- notes
unmapLeader("n")
addGroup("n", "notes")
mapLeader("nn", cmd("ObsidianDailies"), "Daily")
mapLeader("nN", cmd("ObsidianNew"), "New Note")
mapLeader("nb", cmd("ObsidianBacklinks"), "Backlinks")
mapLeader("nc", cmd("ObsidianToggleCheckbox"), "Toggle checkbox")
mapLeader("nr", cmd("ObsidianRename"), "Rename")
mapLeader("nt", cmd("ObsidianTomorrow"), "Tomorrow's note")
mapLeader("nw", cmd("ObsidianWorkspace"), "Workspace")
mapLeader("no", cmd("ObsidianQuickSwitch"), "Quickswitch")
mapLeader("ny", cmd("ObsidianYesterday"), "Yesterday's note")

-- tabs
mapLeader("<TAB>h", cmd("tabfirst"), "First tab")
mapLeader("<TAB>j", cmd("tabprevious"), "Previous tab")
mapLeader("<TAB>k", cmd("tabnext"), "Next tab")
mapLeader("<TAB>l", cmd("tablast"), "Last tab")

-- timers
addGroup("t", "timer")
mapLeader("tt", cmd("TimerHide"), "toggle show")
mapLeader("th", cmd("TimerHide"), "Hide")
mapLeader("tk", cmd("TimerStop"), "Stop")
mapLeader("tp", cmd("TimerPause"), "Pause")
mapLeader("tr", cmd("TimerResume"), "Resume")
mapLeader("ts", cmd("TimerSession pomodoro"), "Pomodoro")
mapLeader("tT", cmd("TimerStart 15m DoTheThing"), "Go! (15m)")

-- ui
Snacks.toggle.zen():map("<leader>z")
Snacks.toggle.zoom():map("<leader>Z")

--windows
unmapLeader("wd")
mapLeader("wk", cmd("q"), "Kill window")
mapLeader("wV", cmd("vert new"), "New window (vertical)")
mapLeader("wS", cmd("new"), "New window (horizontal)")
keymap("n", "<C-w><C-h>", cmd("vert res -5"))
keymap("n", "<C-w><C-j>", cmd("res -5"))
keymap("n", "<C-w><C-k>", cmd("res +5"))
keymap("n", "<C-w><C-l>", cmd("vert res +5"))

-- # visual mode
keymap("v", "<C-j>", ":m .+1<CR>==gv")
keymap("v", "<C-k>", ":m .-2<CR>==gv")
