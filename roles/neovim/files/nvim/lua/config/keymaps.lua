-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit [E]qually" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "[S]plit [X]close" }) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen" }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "[T]ab [X]close" }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext" }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious" }) --  go to previous tab

-- keymaps cheatsheet from Telescope
keymap.set("n", "<leader>k", ":Telescope keymaps<CR>", { desc = "Telescope Keymaps" })

-- copy paste from clipboard
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')

-- select all
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { desc = "Select All" })
