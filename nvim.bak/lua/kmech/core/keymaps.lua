vim.g.mapleader = " "
local keymap = vim.keymap

-- toggle file explorer
keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
-- stop copying after deleting single character
keymap.set("n", "x", '"_x')

-- window splitting
keymap.set("n", "<leader>sv", "<C-w>v") -- vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make windows equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current window

-- tab
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

