return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                vue = { "eslint_d" },
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptvue = { "eslint_d" },
                typescriptvue = { "eslint_d" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "eslint_d" },
                html = { "eslint_d" },
                json = { "eslint_d" },
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
