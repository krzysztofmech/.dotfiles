vim.g.mapleader = " "

local keymap = vim.keymap.set

-- window split vertically
keymap("n", "<leader>w", ":vsplit<CR><C-w>w", { desc = "Window split vertically" })

-- open file explorer
keymap("n", "<leader>b", ":Neotree<CR>", { desc = "Open file explorer" })

-- open terminal
keymap("n", "<leader>ot", function()
    vim.cmd("botright split")
    vim.cmd("terminal")
end, { desc = "Open terminal" })
