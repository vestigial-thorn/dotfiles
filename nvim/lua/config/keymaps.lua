-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local defaultOpts = { noremap = true, silent = true }

local function keymap(mode, keys, action, opts)
  return vim.api.nvim_set_keymap(mode, keys, action, opts or defaultOpts)
end

local function unmap(mode, keys)
  return vim.api.nvim_del_keymap(mode, keys)
end

keymap("v", "<C-j>", ":m .+1<CR>==gv") -- move selection up; keep selected
keymap("v", "<C-k>", ":m .-2<CR>==gv") -- move selection down; keep selected

-- buffers
unmap("n", "<leader>bd")
unmap("n", "<leader>bD")
keymap("n", "<leader>bk", ":b#<CR>", { desc = "Kill buffer" })
keymap("n", "<leader>bK", ":bd<CR>", { desc = "Kill buffer and window" })

-- files
keymap("n", "<leader>fw", ":write<CR>", { desc = "Save file" })

--windows
unmap("n", "<leader>wd")
keymap("n", "<leader>wk", ":q<CR>", { desc = "Kill window" })
