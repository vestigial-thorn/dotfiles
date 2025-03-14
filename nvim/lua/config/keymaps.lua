-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local defaultOpts = { noremap = true, silent = true }

local function keymap(mode, keys, action, opts)
  return vim.api.nvim_set_keymap(mode, keys, action, opts or defaultOpts)
end

keymap("v", "<C-j>", ":m .+1<CR>==gv") -- move selection up; keep selected
keymap("v", "<C-k>", ":m .-2<CR>==gv") -- move selection down; keep selected
keymap("n", "<leader>fs", ":write<CR>")
