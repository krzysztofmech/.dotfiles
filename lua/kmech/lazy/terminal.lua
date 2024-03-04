return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        vim.keymap.set("t", "<C-`>", function()
            vim.cmd("stopinsert")
            vim.cmd("ToggleTerm")
        end, { desc = { "Toggle terminal" } })
    end
}
