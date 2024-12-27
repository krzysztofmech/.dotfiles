return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {
		quiet = true,
		formatters_by_ft = {
			lua = { "stylua" },
			vue = { "prettier", "eslint_d" },
			javascript = { "prettier", "eslint_d" },
			typescript = { "prettier", "eslint_d" },
			javascriptvue = { "prettier", "eslint_d" },
			typescriptvue = { "prettier", "eslint_d" },
			javascriptreact = { "prettier", "eslint_d" },
			typescriptreact = { "prettier", "eslint_d" },
			css = { "prettier", "eslint_d" },
			html = { "prettier", "eslint_d" },
			json = { "fixJson", "jsonlint" },
			graphql = { "prettier", "eslint_d" },
			bash = { "shfmt" },
		},

		vim.keymap.set({ "n", "v" }, "<leader>s", function()
			local conform = require("conform")
			conform.format({
				lsp_fallback = true,
				timeout_ms = 2000,
			})
		end),

		vim.keymap.set({ "n", "v" }, "<leader>l", function()
			local conform = require("conform")
			conform.format({
				lsp_fallback = true,
				timeout_ms = 2000,
				formatters = { "eslint_d" },
			})
		end),
	},
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)
	end,
}
