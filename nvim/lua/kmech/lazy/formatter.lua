return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				vue = { "prettierd", "eslint_d" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				javascriptvue = { "prettierd", "eslint_d" },
				typescriptvue = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				css = { "prettierd", "eslint_d" },
				html = { "prettierd", "eslint_d" },
				json = { "prettierd", "eslint_d" },
				graphql = { "prettierd", "eslint_d" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	timeout_ms = 3000,
			-- },

			vim.keymap.set({ "n", "v" }, "<leader>s", function()
				conform.format({
					lsp_fallback = true,
					timeout_ms = 3000,
				})
			end),
		})
	end,
}
