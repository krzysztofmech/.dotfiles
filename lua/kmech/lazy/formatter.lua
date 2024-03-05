return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                vue = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptvue = { "prettier" },
                typescriptvue = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                graphql = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },

            vim.keymap.set({ "n", "v" }, "<leader>s", function()
                conform.format({
                    lsp_fallback = true,
                    timeout_ms = 500,
                })
            end)
        })
    end
}
