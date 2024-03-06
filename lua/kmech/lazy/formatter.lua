return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                vue = { "eslint_d", "prettierd" },
                javascript = { "eslint_d", "prettierd" },
                typescript = { "eslint_d", "prettierd" },
                javascriptvue = { "eslint_d", "prettierd" },
                typescriptvue = { "eslint_d", "prettierd" },
                javascriptreact = { "eslint_d", "prettierd" },
                typescriptreact = { "eslint_d", "prettierd" },
                css = { "eslint_d", "prettierd" },
                html = { "eslint_d", "prettierd" },
                json = { "eslint_d", "prettierd" },
                graphql = { "eslint_d", "prettierd" },
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
