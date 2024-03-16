return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require("mini.comment").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        require("mini.indentscope").setup({
            symbol = "│",
            options = { try_as_border = true },
        })
    end
}
