return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        vim.keymap.set("n", "<C-`>", ":ToggleTerm<CR>", { desc = { "Toggle terminal" } })
        vim.keymap.set("t", "<C-`>", function()
            vim.cmd("stopinsert")
            vim.cmd("ToggleTerm")
        end, { desc = { "Toggle terminal" } })
    end
}
