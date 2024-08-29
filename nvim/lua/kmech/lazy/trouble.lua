return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require("trouble").setup({
        })
        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle('diagnostics');
        end, { desc = "Toggle trouble" })

        vim.keymap.set("n", "[t", function()
            require("trouble").next({ skip_groups = true, jump = true });
        end, { desc = "Next trouble" })

        vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end,
            { desc = "Toggle diagnostics workspace" })

        vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end,
            { desc = "Toggle diagnostics document" })

        vim.keymap.set("n", "]t", function()
            require("trouble").previous({ skip_groups = true, jump = true });
        end, { desc = "Previous trouble" })
    end
}
