return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "[G]it inline changes [p]review" })
        end
    },
    {
        "tpope/vim-fugitive",
    }
}
