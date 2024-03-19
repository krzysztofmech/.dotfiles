vim.g.mapleader = " "

local keymap = vim.keymap.set

-- move lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
-- window split vertically
keymap("n", "<leader>w", ":vsplit<CR><C-w>w", { desc = "Window split vertically" })

-- move windows
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- open file explorer
keymap("n", "<leader>b", ":Neotree<CR>", { desc = "Open file explorer" })

-- open terminal
keymap("n", "<leader>to", function()
	vim.cmd("botright split")
	vim.cmd("terminal")
end, { desc = "[T]erminal [O]pen" })

-- terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vertical motions
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- paste
keymap("x", "<leader>p", '"_dP')
-- replace all
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[R]eplace cursor" })
-- git diff get
keymap("n", "<leader>gh", "<cmd>diffget //2<CR>")
keymap("n", "<leader>gl", "<cmd>diffget //3<CR>")
