-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---@param mode string|table
---@param keys string
---@param fun string|function
---@param opts table?
local map = function(mode, keys, fun, opts)
  vim.keymap.set(mode, keys, fun, opts)
end

-- better up/down
map({ "n", "x" }, "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Duplicate Lines
map("n", "<leader><down>", "Yp", { desc = "Duplicate Line Down" })
map("n", "<leader>j", "Yp", { desc = "Duplicate Line Down" })
map("n", "<leader><up>", "YP", { desc = "Duplicate Line Up" })
map("n", "<leader>k", "YP", { desc = "Duplicate Line Up" })

-- Move Lines
map("n", "<a-down>", "<cmd>m .+1<cr>==")
map("n", "<a-j>", "<cmd>m .+1<cr>==")
map("n", "<a-up>", "<cmd>m .-2<cr>==")
map("n", "<a-k>", "<cmd>m .-2<cr>==")

-- Move windows using the CTRL key
map("n", "<c-h>", "<C-w>h", { remap = true })
map("n", "<c-left>", "<C-w>h", { remap = true })
map("n", "<c-j>", "<C-w>j", { remap = true })
map("n", "<c-down>", "<C-w>j", { remap = true })
map("n", "<c-k>", "<C-w>k", { remap = true })
map("n", "<c-up>", "<C-w>k", { remap = true })
map("n", "<c-l>", "<C-w>l", { remap = true })
map("n", "<c-right>", "<C-w>l", { remap = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- split Window
map("n", "<leader>ss", "<C-w>s", { desc = "Split Screen horizontal" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split Screen vertical" })
map("n", "<leader>se", "<C-w>=", { desc = "Make Split equal size" })

-- Select All
map({ "i", "n" }, "<C-a>", "<esc>gg<S-v>G")
