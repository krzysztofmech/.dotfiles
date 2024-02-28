return {
    "folke/tokyonight.nvim",
    dependencies = {
        "folke/lsp-colors.nvim"
    },
    config = function()
        require("tokyonight").setup({
            transparent = false,
            terminal_colors = true,
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = false },
                keywords = { italic = false },
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark",   -- style for floating windows
            },
            vim.cmd("colorscheme tokyonight-night")
        })

        require("lsp-colors").setup({
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
        })
    end
}
