return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                vue = { "eslint_d", "prettierd", "prettier" },
                javascript = { "eslint_d", "prettierd", "prettier" },
                typescript = { "eslint_d", "prettierd", "prettier" },
                javascriptvue = { "eslint_d", "prettierd", "prettier" },
                typescriptvue = { "eslint_d", "prettierd", "prettier" },
                javascriptreact = { "eslint_d", "prettierd", "prettier" },
                typescriptreact = { "eslint_d", "prettierd", "prettier" },
                css = { "eslint_d", "prettierd", "prettier" },
                html = { "eslint_d", "prettierd", "prettier" },
                json = { "eslint_d", "prettierd", "prettier" },
                graphql = { "eslint_d", "prettierd", "prettier" },
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
